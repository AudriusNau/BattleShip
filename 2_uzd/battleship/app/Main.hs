module Main where

import System.Environment
import System.Exit
import Data.List

import Game

main :: IO ()
main = do
  (player, gameId) <- getArgs >>= parseArgs
  runGame player gameId

parseArgs :: [String] -> IO (Player, String)
parseArgs argList = case argList of
  ["A", gameId] -> return (PlayerA, gameId)
  ["B", gameId] -> return (PlayerB, gameId)
  _ -> do
    putStrLn "Usage: battleship [A/B] [game_id]"
    exitWith $ ExitFailure 1
