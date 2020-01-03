module Parser.JsonParser1 where
import Data.Char
import Data.List
import Data.Either

type Move = (Char, Int, Bool) -- cordX, cordY, result

defaultMove :: Move
defaultMove = ('X', -1, False)

parseValueItem :: String -> (String, String) -- for parsing one element
parseValueItem m =
   let
       first = takeWhile (\x -> x/= ',' && x/=']') m
       intLength = length first
       rest = drop intLength m
       symbol = head rest
      in
         if symbol ==','
            then (first, drop 1 rest)
         else (first, rest)

parseMove :: String -> Int -> [Move] -> Either String ([Move])
parseMove ('[':m) ind moves =
   let
       (newMove, rest) = fromRight (defaultMove, "]") (parseWords m defaultMove)

       in
           if isRight (parseWords m defaultMove)
               then  parseMove rest (ind + 1) (addMoveByIndex moves newMove (ind + 1))
               else Left $ fromLeft ("Error on parsing") (parseWords m defaultMove)

parseMove (']':rest) ind moves =
   let
   (move:restMoves) = moves
   in if moveAvailable move (movesTakeEverySecond [] 0 restMoves)
       then parseMove rest (ind - 1) moves
       else Left ("Error: there are two moves with the same value"++show moves)
parseMove [] ind moves =
   if ind == (-1)
       then Right moves
       else Left ("Error on parsing, problem with json closing index=" ++ show ind ++ show moves)
parseMove (',':rest) ind moves =
   parseMove rest ind moves
parseMove m ind moves =
   let
       (updatedMove, rest) = fromRight (defaultMove, "]") (parseWords m (getMoveByIndex moves ind))
       in
           if isRight (parseWords m (getMoveByIndex moves ind))
               then parseMove rest ind (setMoveByIndex moves updatedMove ind)
               else Left $ fromLeft ("Error on parsing") (parseWords m defaultMove)



parseWords :: String -> Move -> Either String (Move, String)
parseWords m move =
   let
       (option, rest) = parseItem m
   in if (isSubsequenceOf option "result")
       then parseMoveResult rest move
       else if (isSubsequenceOf option "coord")
           then parseMoveCoord rest move
           else if (isSubsequenceOf option "prev")
               then Right (move, rest)
               else Left ("Error on parsing: undefined parse type " ++ show option)


parseItem :: String -> (String, String) -- for parsing one element
parseItem m =
     let
         first = takeWhile (/= ',') m
         intLength = length first + 1
         rest = drop intLength m
         in (first, rest)


parseMoveResult :: String -> Move -> Either String (Move, String)
parseMoveResult m move =
   let
       (value, rest) = parseValueItem m
   in if (isSubsequenceOf value "MISS")
       then Right (setMoveResult move False, rest)
       else if (isSubsequenceOf value "HIT")
           then Right (setMoveResult move True, rest)
           else Left ("Result value is undefined: " ++ show value)

parseMoveCoord :: String -> Move -> Either String (Move, String)
parseMoveCoord m move =
   let
       (cordX, cordY, rest) = parseItems m
       (x:_) = cordX
       y = read cordY
       in if x >= 'A' && x <= 'J' && y >= 1 && y <= 10
           then Right (setMoveCoord move x y, rest)
           else Left ("Coord values is undefined x=" ++ show cordX ++ " y=" ++ show cordY)

setMoveResult :: Move -> Bool -> Move
setMoveResult (cordX, cordY, _) result = (cordX, cordY, result)

setMoveCoord :: Move -> Char -> Int -> Move
setMoveCoord (_, _, result) x y = (x, y, result)


parseItems :: String -> (String, String, String) -- for parsing cords array
parseItems ('[':m) =
   let
       value1 = take 1 m    --paimame pirma elem
       rest = drop 2 m
       value2 = takeWhile (/=']') rest-- paimame 2 elem
       intDrop = length value2+1
       rest1 = drop intDrop rest
       symbol = head rest1 -- jeigu simbolis ']' paliekame jei ',' numetame kableli
   in
       if symbol == ','
        then (value1, value2,drop 1 rest1)
        else (value1, value2, rest1)


-- move moves
moveAvailable :: Move -> [Move] -> Bool
moveAvailable move [] = True
moveAvailable move (compareMove:restMoves) =
   let
       (cordX,cordY,_) = move
       (compareCordX, compareCordY, _) = compareMove
   in if compareCordX == cordX && compareCordY == cordY && move/=defaultMove
       then False
       else moveAvailable move restMoves

-- [] 0 moves
movesTakeEverySecond :: [Move] -> Int -> [Move] -> [Move]
movesTakeEverySecond moves _ [] = moves
movesTakeEverySecond moves 0 (_:rest) = movesTakeEverySecond moves 1 rest
movesTakeEverySecond moves 1 (move:rest) = movesTakeEverySecond (move:moves) 0 rest

addMoveByIndex :: [Move] -> Move -> Int -> [Move]
addMoveByIndex moves move ind =
   let (x, xs) = splitAt ind moves
   in x ++ move : xs

getMoveByIndex :: [Move] -> Int -> Move
getMoveByIndex moves ind =
   let move = moves!!ind
       in move

setMoveByIndex :: [Move] -> Move -> Int -> [Move]
setMoveByIndex moves move ind =
   let (x,_:xs) = splitAt ind moves
   in x ++ move : xs

