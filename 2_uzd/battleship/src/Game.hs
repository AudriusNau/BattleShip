module Game where

import System.Exit

import Encode
import Grid
import Parser
import RemoteGame

data Player = PlayerA | PlayerB deriving (Eq)
data Game = Game {
  player :: Player,
  gameId :: String,
  grid :: Grid,
  step :: Int
}

instance Show Player where
  show PlayerA = "A"
  show PlayerB = "B"

gameGrid :: Grid
gameGrid = [[Grid.Miss, Grid.Miss, Grid.Miss, Grid.Hit, Grid.Hit, Grid.Hit, Grid.Miss, Grid.Miss, Grid.Miss, Grid.Miss],
            [Grid.Miss, Grid.Miss, Grid.Miss, Grid.Miss, Grid.Hit, Grid.Miss, Grid.Miss, Grid.Miss, Grid.Miss, Grid.Miss],
            [Grid.Miss, Grid.Miss, Grid.Miss, Grid.Miss, Grid.Hit, Grid.Miss, Grid.Miss, Grid.Miss, Grid.Miss, Grid.Miss],
            [Grid.Miss, Grid.Miss, Grid.Hit, Grid.Hit, Grid.Hit, Grid.Miss, Grid.Miss, Grid.Miss, Grid.Miss, Grid.Miss],
            [Grid.Miss, Grid.Miss, Grid.Miss, Grid.Hit, Grid.Miss, Grid.Miss, Grid.Miss, Grid.Miss, Grid.Hit, Grid.Miss],
            [Grid.Miss, Grid.Miss, Grid.Miss, Grid.Hit, Grid.Miss, Grid.Miss, Grid.Miss, Grid.Miss, Grid.Hit, Grid.Miss],
            [Grid.Miss, Grid.Miss, Grid.Miss, Grid.Miss, Grid.Miss, Grid.Miss, Grid.Miss, Grid.Hit, Grid.Hit, Grid.Hit],
            [Grid.Hit, Grid.Hit, Grid.Hit, Grid.Miss, Grid.Hit, Grid.Hit, Grid.Hit, Grid.Miss, Grid.Miss, Grid.Miss],
            [Grid.Miss, Grid.Hit, Grid.Miss, Grid.Miss, Grid.Miss, Grid.Hit, Grid.Miss, Grid.Miss, Grid.Miss, Grid.Miss],
            [Grid.Miss, Grid.Hit, Grid.Miss, Grid.Miss, Grid.Miss, Grid.Hit, Grid.Miss, Grid.Miss, Grid.Miss, Grid.Miss]]


runGame :: Player -> String -> IO ()
runGame player gameId = runGameStep game
  where
    game = Game {player = player, gameId = gameId, grid = gameGrid, step = 0}


runGameStep :: Game -> IO ()
runGameStep game = do

  messageStr <- getCurrentMessageStr game

  let messageResult = parse messageStr >>= addMoveResult game . wrapInNewMessage  >>= (addAttack game)
  case messageResult of
    Left errorMsg -> putStrLn $ "Step: " ++ show (step game) ++ " | " ++ errorMsg
    Right message -> do


      putStrLn $ "Step: " ++ show (step game) ++ " | Last move result: "
        ++ show (result message) ++ " | Next move: " ++ show (coord message)

      case coord message of
        Nothing -> putStrLn $ "No more moves to be made - end of the game - player "
          ++ show (anotherPlayer $ player game) ++ " won"
        _ -> do

          sendCurrentMessage message game
          runGameStep $ game {step = (step game) + 1}


anotherPlayer :: Player -> Player
anotherPlayer PlayerA = PlayerB
anotherPlayer PlayerB = PlayerA


getCurrentMessageStr :: Game -> IO String
getCurrentMessageStr Game {player = PlayerA, step = 0} = do return ""
getCurrentMessageStr game = do
  (responseCode, message) <- getMessage (show $ player game) (gameId game)
  if (responseCode /= 200)
    then do
      putStrLn $ "Wrong response code received 1: " ++ (show responseCode)
      exitWith $ ExitFailure 3
    else return message


sendCurrentMessage :: Message -> Game -> IO ()
sendCurrentMessage message game = do
  let messageStr = messageToJson message
  responseCode <- sendMessage messageStr (show $ player game) (gameId game)
  case responseCode of
    204 -> do return ()
    _ -> do
      putStrLn $ "Wrong response code received 2: " ++ (show responseCode)
      exitWith $ ExitFailure 2
      return ()


wrapInNewMessage :: Message -> Message
wrapInNewMessage message = emptyMessage {prev = (if message == emptyMessage then Nothing else Just message)}


addMoveResult :: Game -> Message -> Either String Message
addMoveResult game message = case message of
  Message {prev = Nothing} -> Right message
  Message {prev = Just Message {coord = Just (coordX, coordY)}}
    -> Right message {result = getMoveResult (coordX, coordY) (grid game)}
  Message {prev = Just Message {coord = Nothing}} -> Left "I won"


addAttack :: Game -> Message -> Either String Message
addAttack game message = do
  (gridA, gridB) <- makeGrids message
  return $ message {coord = (case findNextMove gridA gridB game of
     Just [coordX, coordY] -> Just (coordX, coordY)
     _ -> Nothing)}


getMoveResult :: (String, String) -> Grid -> Maybe Result
getMoveResult (coordXStr, coordYStr) grid = case gridCellValue of
  Grid.Hit -> Just Parser.Hit
  Grid.Miss -> Just Parser.Miss
  where
    gridCellValue = gridElementByCoords grid (letterToNumber coordXStr) (read coordYStr)


gridElementByCoords :: Grid -> Int -> Int -> GridCell
gridElementByCoords grid x y = grid !! (y - 1) !! (x - 1)


findNextMove :: Grid -> Grid -> Game -> Maybe [String]
findNextMove grid1 grid2 game =
  if length hitGrid1Cells >= maxHitCount || length hitGrid2Cells >= maxHitCount
  then Nothing
  else case clearCells of
    [] -> Nothing
    _ -> Just [numberToLetter x, show y]
      where
        cellList = if null clearCellsNearHitCells || hitCellsRemainder4 == 0
          then clearCells
          else clearCellsNearHitCells
        hitCellsRemainder4 = (length hitCells) `rem` 5
        rotatedCellList = rotate (length hitCells * 2 + (length cellList `div` 2)) cellList
        index = ((length cellList `div` 5) * hitCellsRemainder4)
        (x, y) = rotatedCellList !! if index < length rotatedCellList
          then index
          else length rotatedCellList `div` 2
  where
    maxHitCount = 25
    hitGrid1Cells = filterCoords grid1 (== Grid.Hit)
    hitGrid2Cells = filterCoords grid2 (== Grid.Hit)
    clearCellCount grid = length $ filter (== Clear) $ concat grid
    gridForMove = if ((player game) == PlayerA) then grid2 else grid1
    hitCells = filterCoords gridForMove (== Grid.Hit)
    clearCellsNearHitCells = findclearCellsNearHitCells gridForMove hitCells
    clearCells = filterCoords gridForMove (== Clear)


filterCoords :: Grid -> (GridCell -> Bool) -> [(Int, Int)]
filterCoords grid checkValueFunc =
    [(x, y) | (x, row) <- zip [1..] grid, (y, elem) <- zip [1..] row, checkValueFunc elem]


findclearCellsNearHitCells :: Grid -> [(Int, Int)] -> [(Int, Int)]
findclearCellsNearHitCells grid hitCells =
  [(x, y) | (x, row) <- zip [1..] grid, (y, val) <- zip [1..] row, val == Clear, (x, y) `elem` cellsAroundHitCells]
  where
    cellsAroundHitCells = [cell | (x, y) <- hitCells, cell <- [(x-1, y), (x+1, y), (x, y-1), (x, y+1)]]

rotate :: Int -> [a] -> [a]
rotate _ [] = []
rotate n xs = zipWith const (drop n (cycle xs)) xs

includes :: String -> String -> Bool
includes (x:xs) [] = False
includes xs ys = prefix xs ys || includes xs (tail ys)

prefix :: String -> String -> Bool
prefix [] ys = True
prefix (x:xs) [] = False
prefix (x:xs) (y:ys) = (x == y) && prefix xs ys