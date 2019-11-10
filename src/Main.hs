module Main where

import Data.List
import Data.Either
import Data.Maybe


main :: IO ()
main = print "hello"
-- "result,HIT"

msg :: String
msg = "[prev,[prev,[result,HIT,prev,[coord,[J,2],result,MISS,prev,[coord,[I,10],prev,[prev,[coord,[A,10]],coord,[D,6],result,HIT],result,MISS]],coord,[I,6]],coord,[E,1],result,MISS],coord,[B,3],result,MISS]"
msg1 :: String
msg1 = "[prev,[result,HIT,prev,[coord,[D,9]],coord,[C,9]],coord,[D,9],result,HIT]"
msg2 :: String
msg2 = "[result,MISS,prev,[prev,[coord,[B,8],prev,[prev,[coord,[G,4],result,MISS,prev,[result,MISS,coord,[I,8],prev,[coord,[F,1],result,MISS,prev,[prev,[prev,[coord,[H,8],result,HIT,prev,[coord,[B,4],prev,[result,MISS,prev,[coord,[B,6]],coord,[G,7]],result,HIT]],result,MISS,coord,[D,9]],coord,[D,6],result,HIT]]]],coord,[I,5],result,MISS],result,MISS],result,HIT,coord,[B,6]],coord,[D,7]]"
msg3 :: String
msg3 = "[\"prev\",[\"result\",\"MISS\",\"coord\",[\"I\",\"5\"],\"prev\",[\"result\",\"MISS\",\"coord\",[\"F\",\"2\"],\"prev\",[\"prev\",[\"coord\",[\"A\",\"6\"],\"prev\",[\"coord\",[\"A\",\"10\"],\"result\",\"MISS\",\"prev\",[\"result\",\"MISS\",\"prev\",[\"coord\",[\"E\",\"4\"],\"result\",\"HIT\",\"prev\",[\"result\",\"HIT\",\"coord\",[\"C\",\"10\"],\"prev\",[\"prev\",[\"coord\",[\"E\",\"2\"],\"prev\",[\"coord\",[\"D\",\"5\"],\"result\",\"HIT\",\"prev\",[\"prev\",[\"coord\",[\"C\",\"10\"],\"prev\",[\"result\",\"MISS\",\"coord\",[\"G\",\"4\"],\"prev\",[\"result\",\"HIT\",\"coord\",[\"J\",\"8\"],\"prev\",[\"prev\",[\"coord\",[\"H\",\"4\"],\"result\",\"MISS\",\"prev\",[\"coord\",[\"J\",\"1\"],\"prev\",[\"coord\",[\"J\",\"10\"],\"result\",\"MISS\",\"prev\",[\"coord\",[\"I\",\"7\"],\"result\",\"MISS\",\"prev\",[\"prev\",[\"result\",\"MISS\",\"prev\",[\"coord\",[\"J\",\"7\"],\"prev\",[\"prev\",[\"coord\",[\"E\",\"7\"],\"result\",\"MISS\",\"prev\",[\"result\",\"MISS\",\"coord\",[\"A\",\"9\"],\"prev\",[\"coord\",[\"H\",\"5\"],\"result\",\"HIT\",\"prev\",[\"prev\",[\"result\",\"HIT\",\"prev\",[\"prev\",[\"coord\",[\"I\",\"8\"],\"prev\",[\"coord\",[\"C\",\"9\"],\"prev\",[\"coord\",[\"F\",\"1\"],\"prev\",[\"prev\",[\"prev\",[\"coord\",[\"F\",\"5\"],\"result\",\"MISS\",\"prev\",[\"prev\",[\"coord\",[\"H\",\"9\"],\"prev\",[\"coord\",[\"B\",\"4\"],\"result\",\"MISS\",\"prev\",[\"prev\",[\"coord\",[\"I\",\"3\"],\"result\",\"MISS\",\"prev\",[\"prev\",[\"result\",\"HIT\",\"coord\",[\"F\",\"3\"],\"prev\",[\"coord\",[\"J\",\"2\"],\"prev\",[\"prev\",[\"prev\",[\"result\",\"MISS\",\"prev\",[\"result\",\"MISS\",\"prev\",[\"result\",\"MISS\",\"prev\",[\"coord\",[\"C\",\"6\"],\"result\",\"MISS\",\"prev\",[\"prev\",[\"result\",\"MISS\",\"prev\",[\"prev\",[\"result\",\"HIT\",\"prev\",[\"coord\",[\"B\",\"9\"],\"result\",\"MISS\",\"prev\",[\"result\",\"MISS\",\"prev\",[\"result\",\"MISS\",\"prev\",[\"result\",\"MISS\",\"prev\",[\"coord\",[\"C\",\"4\"],\"result\",\"MISS\",\"prev\",[\"result\",\"HIT\",\"coord\",[\"E\",\"9\"],\"prev\",[\"result\",\"MISS\",\"prev\",[\"result\",\"MISS\",\"prev\",[\"result\",\"MISS\",\"coord\",[\"J\",\"1\"],\"prev\",[\"coord\",[\"G\",\"1\"],\"result\",\"MISS\",\"prev\",[\"prev\",[\"coord\",[\"E\",\"4\"],\"prev\",[\"prev\",[\"result\",\"HIT\",\"coord\",[\"D\",\"3\"],\"prev\",[\"coord\",[\"F\",\"9\"],\"prev\",[\"coord\",[\"I\",\"1\"],\"prev\",[\"prev\",[\"coord\",[\"J\",\"3\"],\"result\",\"MISS\",\"prev\",[\"result\",\"MISS\",\"coord\",[\"A\",\"2\"],\"prev\",[\"prev\",[\"result\",\"MISS\",\"coord\",[\"C\",\"2\"],\"prev\",[\"coord\",[\"D\",\"2\"],\"result\",\"MISS\",\"prev\",[\"prev\",[\"prev\",[\"result\",\"MISS\",\"coord\",[\"E\",\"2\"],\"prev\",[\"result\",\"MISS\",\"coord\",[\"H\",\"6\"],\"prev\",[\"result\",\"MISS\",\"prev\",[\"coord\",[\"G\",\"5\"],\"result\",\"MISS\",\"prev\",[\"coord\",[\"C\",\"9\"],\"result\",\"HIT\",\"prev\",[\"coord\",[\"G\",\"10\"],\"result\",\"HIT\",\"prev\",[\"result\",\"MISS\",\"prev\",[\"prev\",[\"prev\",[\"coord\",[\"I\",\"9\"],\"prev\",[\"prev\",[\"prev\",[\"prev\",[\"result\",\"MISS\",\"coord\",[\"J\",\"5\"],\"prev\",[\"result\",\"MISS\",\"prev\",[\"prev\",[\"prev\",[\"result\",\"MISS\",\"coord\",[\"A\",\"1\"],\"prev\",[\"coord\",[\"E\",\"1\"],\"result\",\"MISS\",\"prev\",[\"coord\",[\"B\",\"4\"],\"result\",\"MISS\",\"prev\",[\"coord\",[\"F\",\"2\"],\"result\",\"HIT\",\"prev\",[\"coord\",[\"F\",\"8\"],\"prev\",[\"coord\",[\"I\",\"9\"],\"result\",\"MISS\",\"prev\",[\"coord\",[\"D\",\"7\"],\"prev\",[\"coord\",[\"F\",\"7\"],\"result\",\"MISS\",\"prev\",[\"coord\",[\"I\",\"5\"],\"prev\",[\"prev\",[\"result\",\"MISS\",\"prev\",[\"result\",\"HIT\",\"prev\",[\"coord\",[\"A\",\"4\"],\"prev\",[\"result\",\"MISS\",\"prev\",[\"prev\",[\"prev\",[\"prev\",[\"result\",\"HIT\",\"coord\",[\"D\",\"2\"],\"prev\",[\"coord\",[\"B\",\"8\"]]],\"result\",\"MISS\",\"coord\",[\"F\",\"4\"]],\"result\",\"MISS\",\"coord\",[\"I\",\"6\"]],\"result\",\"MISS\",\"coord\",[\"H\",\"2\"]],\"coord\",[\"B\",\"8\"]],\"result\",\"HIT\"],\"coord\",[\"G\",\"2\"]],\"coord\",[\"J\",\"8\"]],\"coord\",[\"C\",\"6\"],\"result\",\"MISS\"],\"result\",\"MISS\"]],\"result\",\"MISS\"]],\"result\",\"MISS\"]]]]],\"result\",\"MISS\",\"coord\",[\"D\",\"6\"]],\"result\",\"MISS\",\"coord\",[\"G\",\"6\"]],\"coord\",[\"G\",\"4\"]]],\"coord\",[\"J\",\"9\"],\"result\",\"MISS\"],\"coord\",[\"E\",\"1\"],\"result\",\"MISS\"],\"result\",\"MISS\",\"coord\",[\"H\",\"10\"]],\"result\",\"MISS\"],\"coord\",[\"B\",\"6\"],\"result\",\"MISS\"],\"coord\",[\"C\",\"8\"],\"result\",\"MISS\"],\"coord\",[\"H\",\"3\"]]]]],\"coord\",[\"C\",\"7\"]]]],\"result\",\"MISS\",\"coord\",[\"I\",\"8\"]],\"result\",\"MISS\",\"coord\",[\"I\",\"1\"]]]],\"coord\",[\"D\",\"5\"],\"result\",\"HIT\"]]],\"result\",\"HIT\",\"coord\",[\"A\",\"1\"]],\"result\",\"MISS\"],\"result\",\"MISS\"]],\"result\",\"MISS\",\"coord\",[\"I\",\"2\"]],\"result\",\"MISS\"],\"result\",\"MISS\",\"coord\",[\"H\",\"6\"]]]],\"coord\",[\"F\",\"2\"]],\"coord\",[\"F\",\"8\"]]]],\"coord\",[\"G\",\"8\"]],\"coord\",[\"I\",\"4\"]],\"coord\",[\"B\",\"6\"]]],\"coord\",[\"H\",\"7\"]],\"coord\",[\"G\",\"1\"],\"result\",\"MISS\"],\"coord\",[\"H\",\"5\"]],\"result\",\"MISS\",\"coord\",[\"D\",\"8\"]]],\"coord\",[\"F\",\"6\"]],\"coord\",[\"E\",\"7\"]],\"coord\",[\"J\",\"5\"]],\"coord\",[\"D\",\"9\"],\"result\",\"MISS\"],\"result\",\"MISS\",\"coord\",[\"E\",\"3\"]],\"result\",\"MISS\"]],\"result\",\"MISS\",\"coord\",[\"H\",\"10\"]]],\"coord\",[\"A\",\"8\"],\"result\",\"HIT\"]],\"result\",\"MISS\"],\"result\",\"MISS\",\"coord\",[\"G\",\"6\"]]],\"result\",\"MISS\",\"coord\",[\"B\",\"3\"]],\"result\",\"MISS\",\"coord\",[\"B\",\"3\"]],\"result\",\"MISS\"],\"result\",\"MISS\"],\"result\",\"MISS\"],\"result\",\"MISS\",\"coord\",[\"B\",\"5\"]],\"coord\",[\"B\",\"5\"]],\"coord\",[\"B\",\"10\"],\"result\",\"HIT\"]]]],\"coord\",[\"H\",\"3\"],\"result\",\"MISS\"],\"result\",\"HIT\"],\"coord\",[\"D\",\"4\"]],\"result\",\"MISS\",\"coord\",[\"D\",\"10\"]]]],\"result\",\"MISS\"]],\"coord\",[\"B\",\"9\"],\"result\",\"MISS\"]]],\"result\",\"MISS\"],\"coord\",[\"D\",\"1\"],\"result\",\"HIT\"]],\"result\",\"MISS\"],\"result\",\"MISS\",\"coord\",[\"F\",\"10\"]]]],\"coord\",[\"H\",\"1\"]]],\"result\",\"HIT\"],\"result\",\"HIT\",\"coord\",[\"A\",\"9\"]]]],\"coord\",[\"D\",\"6\"],\"result\",\"MISS\"]"
msg4 :: String
msg4 = "[\"prev\",[\"coord\",[\"B\",\"8\"],\"result\",\"MISS\",\"prev\",[\"prev\",[\"result\",\"HIT\",\"coord\",[\"I\",\"7\"],\"prev\",[\"prev\",[\"result\",\"MISS\",\"coord\",[\"F\",\"8\"],\"prev\",[\"result\",\"MISS\",\"prev\",[\"coord\",[\"H\",\"7\"],\"prev\",[\"result\",\"MISS\",\"prev\",[\"prev\",[\"result\",\"MISS\",\"prev\",[\"prev\",[\"prev\",[\"result\",\"MISS\",\"prev\",[\"prev\",[\"prev\",[\"result\",\"MISS\",\"prev\",[\"coord\",[\"H\",\"6\"],\"prev\",[\"result\",\"MISS\",\"coord\",[\"E\",\"1\"],\"prev\",[\"result\",\"MISS\",\"coord\",[\"G\",\"6\"],\"prev\",[\"prev\",[\"result\",\"MISS\",\"coord\",[\"C\",\"5\"],\"prev\",[\"prev\",[\"result\",\"MISS\",\"prev\",[\"prev\",[\"prev\",[\"result\",\"MISS\",\"prev\",[\"coord\",[\"D\",\"5\"],\"prev\",[\"result\",\"MISS\",\"prev\",[\"result\",\"MISS\",\"prev\",[\"coord\",[\"G\",\"6\"],\"prev\",[\"coord\",[\"I\",\"1\"],\"result\",\"MISS\",\"prev\",[\"prev\",[\"result\",\"HIT\",\"prev\",[\"prev\",[\"result\",\"HIT\",\"prev\",[\"prev\",[\"coord\",[\"A\",\"5\"],\"result\",\"MISS\",\"prev\",[\"coord\",[\"F\",\"1\"],\"prev\",[\"coord\",[\"G\",\"8\"],\"result\",\"HIT\",\"prev\",[\"coord\",[\"B\",\"10\"],\"result\",\"HIT\",\"prev\",[\"result\",\"MISS\",\"coord\",[\"H\",\"2\"],\"prev\",[\"prev\",[\"result\",\"MISS\",\"coord\",[\"F\",\"1\"],\"prev\",[\"coord\",[\"G\",\"2\"],\"prev\",[\"result\",\"MISS\",\"coord\",[\"C\",\"10\"],\"prev\",[\"coord\",[\"E\",\"5\"],\"prev\",[\"coord\",[\"I\",\"2\"],\"prev\",[\"result\",\"MISS\",\"prev\",[\"coord\",[\"B\",\"7\"],\"result\",\"MISS\",\"prev\",[\"coord\",[\"D\",\"3\"],\"prev\",[\"prev\",[\"prev\",[\"coord\",[\"C\",\"9\"],\"prev\",[\"coord\",[\"G\",\"10\"],\"prev\",[\"prev\",[\"coord\",[\"J\",\"7\"],\"result\",\"HIT\",\"prev\",[\"coord\",[\"E\",\"8\"],\"result\",\"MISS\",\"prev\",[\"prev\",[\"prev\",[\"coord\",[\"G\",\"4\"]],\"result\",\"MISS\",\"coord\",[\"J\",\"9\"]],\"coord\",[\"F\",\"3\"],\"result\",\"HIT\"]]],\"coord\",[\"D\",\"9\"],\"result\",\"HIT\"],\"result\",\"MISS\"],\"result\",\"MISS\"],\"coord\",[\"D\",\"6\"],\"result\",\"MISS\"],\"coord\",[\"F\",\"10\"],\"result\",\"MISS\"],\"result\",\"HIT\"]],\"coord\",[\"B\",\"3\"]],\"result\",\"MISS\"],\"result\",\"MISS\"]],\"result\",\"MISS\"]],\"coord\",[\"J\",\"5\"],\"result\",\"HIT\"]]]],\"result\",\"MISS\"]],\"coord\",[\"I\",\"10\"],\"result\",\"MISS\"],\"coord\",[\"D\",\"10\"]],\"coord\",[\"F\",\"8\"],\"result\",\"MISS\"],\"coord\",[\"E\",\"2\"]],\"result\",\"MISS\",\"coord\",[\"H\",\"10\"]]],\"result\",\"MISS\"],\"coord\",[\"A\",\"6\"]],\"coord\",[\"E\",\"9\"]],\"result\",\"MISS\"],\"coord\",[\"J\",\"9\"]],\"result\",\"MISS\",\"coord\",[\"E\",\"3\"]],\"result\",\"MISS\",\"coord\",[\"D\",\"8\"]],\"coord\",[\"A\",\"10\"]],\"coord\",[\"D\",\"1\"],\"result\",\"MISS\"]],\"coord\",[\"H\",\"4\"],\"result\",\"MISS\"]]],\"result\",\"MISS\"],\"coord\",[\"A\",\"3\"]],\"result\",\"MISS\",\"coord\",[\"E\",\"9\"]],\"coord\",[\"C\",\"3\"],\"result\",\"MISS\"],\"coord\",[\"G\",\"4\"]],\"result\",\"MISS\",\"coord\",[\"B\",\"9\"]],\"result\",\"MISS\",\"coord\",[\"D\",\"4\"]],\"coord\",[\"A\",\"5\"]],\"coord\",[\"J\",\"5\"],\"result\",\"MISS\"],\"coord\",[\"F\",\"5\"]],\"result\",\"MISS\"],\"coord\",[\"G\",\"1\"]]],\"coord\",[\"C\",\"10\"],\"result\",\"MISS\"]],\"result\",\"MISS\",\"coord\",[\"I\",\"4\"]]],\"result\",\"HIT\",\"coord\",[\"I\",\"6\"]]"
msg5 :: String
msg5 = "[\"prev\",[\"coord\",[\"B\",\"6\"],\"result\",\"MISS\",\"prev\",[\"result\",\"MISS\",\"prev\",[\"coord\",[\"I\",\"1\"],\"result\",\"MISS\",\"prev\",[\"prev\",[\"prev\",[\"prev\",[\"prev\",[\"prev\",[\"prev\",[\"result\",\"MISS\",\"prev\",[\"coord\",[\"G\",\"2\"],\"prev\",[\"prev\",[\"coord\",[\"F\",\"8\"],\"prev\",[\"prev\",[\"result\",\"MISS\",\"coord\",[\"A\",\"3\"],\"prev\",[\"coord\",[\"C\",\"7\"],\"result\",\"MISS\",\"prev\",[\"result\",\"HIT\",\"coord\",[\"J\",\"9\"],\"prev\",[\"prev\",[\"prev\",[\"prev\",[\"prev\",[\"coord\",[\"G\",\"8\"],\"prev\",[\"prev\",[\"prev\",[\"coord\",[\"E\",\"3\"],\"prev\",[\"coord\",[\"E\",\"5\"],\"prev\",[\"prev\",[\"coord\",[\"I\",\"10\"],\"prev\",[\"prev\",[\"prev\",[\"coord\",[\"E\",\"4\"],\"result\",\"MISS\",\"prev\",[\"prev\",[\"result\",\"MISS\",\"coord\",[\"H\",\"10\"],\"prev\",[\"prev\",[\"coord\",[\"F\",\"4\"],\"result\",\"MISS\",\"prev\",[\"coord\",[\"H\",\"9\"],\"result\",\"MISS\",\"prev\",[\"coord\",[\"A\",\"1\"],\"result\",\"MISS\",\"prev\",[\"prev\",[\"prev\",[\"coord\",[\"I\",\"8\"],\"result\",\"MISS\",\"prev\",[\"result\",\"HIT\",\"coord\",[\"C\",\"7\"],\"prev\",[\"coord\",[\"B\",\"5\"],\"prev\",[\"result\",\"HIT\",\"prev\",[\"result\",\"MISS\",\"prev\",[\"prev\",[\"prev\",[\"coord\",[\"G\",\"3\"],\"result\",\"MISS\",\"prev\",[\"result\",\"MISS\",\"coord\",[\"J\",\"9\"],\"prev\",[\"result\",\"MISS\",\"coord\",[\"F\",\"6\"],\"prev\",[\"result\",\"MISS\",\"coord\",[\"J\",\"1\"],\"prev\",[\"result\",\"MISS\",\"prev\",[\"coord\",[\"A\",\"2\"],\"prev\",[\"prev\",[\"coord\",[\"C\",\"4\"],\"result\",\"MISS\",\"prev\",[\"coord\",[\"B\",\"3\"],\"prev\",[\"result\",\"HIT\",\"prev\",[\"prev\",[\"result\",\"MISS\",\"coord\",[\"F\",\"3\"],\"prev\",[\"prev\",[\"coord\",[\"G\",\"3\"],\"result\",\"MISS\",\"prev\",[\"result\",\"MISS\",\"coord\",[\"D\",\"7\"],\"prev\",[\"result\",\"MISS\",\"coord\",[\"H\",\"7\"],\"prev\",[\"prev\",[\"prev\",[\"coord\",[\"D\",\"8\"],\"result\",\"MISS\",\"prev\",[\"coord\",[\"H\",\"6\"],\"result\",\"MISS\",\"prev\",[\"coord\",[\"D\",\"9\"],\"result\",\"HIT\",\"prev\",[\"coord\",[\"F\",\"9\"],\"prev\",[\"prev\",[\"coord\",[\"B\",\"2\"],\"result\",\"MISS\",\"prev\",[\"coord\",[\"I\",\"10\"],\"result\",\"MISS\",\"prev\",[\"coord\",[\"G\",\"6\"],\"prev\",[\"coord\",[\"B\",\"8\"],\"result\",\"MISS\",\"prev\",[\"result\",\"HIT\",\"prev\",[\"coord\",[\"B\",\"10\"],\"result\",\"MISS\",\"prev\",[\"prev\",[\"prev\",[\"prev\",[\"prev\",[\"coord\",[\"A\",\"10\"],\"result\",\"MISS\",\"prev\",[\"result\",\"MISS\",\"prev\",[\"coord\",[\"A\",\"8\"],\"result\",\"HIT\",\"prev\",[\"prev\",[\"coord\",[\"A\",\"7\"],\"result\",\"MISS\",\"prev\",[\"result\",\"MISS\",\"coord\",[\"D\",\"6\"],\"prev\",[\"prev\",[\"result\",\"HIT\",\"coord\",[\"E\",\"5\"],\"prev\",[\"prev\",[\"result\",\"MISS\",\"coord\",[\"A\",\"8\"],\"prev\",[\"coord\",[\"E\",\"4\"],\"result\",\"MISS\",\"prev\",[\"coord\",[\"D\",\"10\"],\"prev\",[\"prev\",[\"prev\",[\"prev\",[\"result\",\"HIT\",\"coord\",[\"A\",\"9\"],\"prev\",[\"prev\",[\"prev\",[\"coord\",[\"G\",\"5\"],\"result\",\"MISS\",\"prev\",[\"result\",\"MISS\",\"prev\",[\"prev\",[\"result\",\"MISS\",\"prev\",[\"coord\",[\"F\",\"2\"],\"prev\",[\"coord\",[\"H\",\"9\"],\"result\",\"MISS\",\"prev\",[\"coord\",[\"C\",\"6\"],\"result\",\"HIT\",\"prev\",[\"coord\",[\"C\",\"2\"],\"prev\",[\"result\",\"MISS\",\"prev\",[\"coord\",[\"C\",\"6\"],\"prev\",[\"result\",\"MISS\",\"prev\",[\"prev\",[\"coord\",[\"C\",\"2\"],\"result\",\"MISS\",\"prev\",[\"coord\",[\"C\",\"4\"],\"prev\",[\"result\",\"MISS\",\"coord\",[\"G\",\"4\"],\"prev\",[\"coord\",[\"H\",\"4\"],\"result\",\"MISS\",\"prev\",[\"coord\",[\"A\",\"3\"],\"prev\",[\"coord\",[\"F\",\"5\"],\"result\",\"HIT\",\"prev\",[\"coord\",[\"B\",\"10\"],\"prev\",[\"prev\",[\"result\",\"MISS\",\"prev\",[\"prev\",[\"coord\",[\"E\",\"1\"],\"result\",\"MISS\",\"prev\",[\"prev\",[\"result\",\"HIT\",\"prev\",[\"coord\",[\"G\",\"10\"],\"result\",\"MISS\",\"prev\",[\"prev\",[\"prev\",[\"coord\",[\"C\",\"10\"]],\"result\",\"HIT\",\"coord\",[\"D\",\"2\"]],\"coord\",[\"J\",\"7\"],\"result\",\"MISS\"]],\"coord\",[\"I\",\"9\"]],\"result\",\"MISS\",\"coord\",[\"G\",\"8\"]]],\"result\",\"MISS\",\"coord\",[\"F\",\"7\"]],\"coord\",[\"C\",\"5\"]],\"result\",\"HIT\",\"coord\",[\"I\",\"9\"]],\"result\",\"MISS\"]],\"result\",\"MISS\"]]],\"result\",\"MISS\"]],\"coord\",[\"E\",\"9\"],\"result\",\"HIT\"],\"coord\",[\"E\",\"6\"]],\"result\",\"MISS\"],\"coord\",[\"G\",\"2\"]],\"result\",\"MISS\"]]],\"result\",\"MISS\"],\"coord\",[\"A\",\"7\"]],\"coord\",[\"A\",\"9\"],\"result\",\"MISS\"],\"coord\",[\"E\",\"1\"]]],\"coord\",[\"J\",\"2\"],\"result\",\"MISS\"],\"coord\",[\"A\",\"4\"],\"result\",\"HIT\"]],\"coord\",[\"D\",\"10\"],\"result\",\"MISS\"],\"result\",\"MISS\",\"coord\",[\"C\",\"10\"]],\"result\",\"HIT\",\"coord\",[\"G\",\"9\"]],\"result\",\"MISS\"]]],\"result\",\"MISS\",\"coord\",[\"B\",\"8\"]]],\"coord\",[\"D\",\"4\"],\"result\",\"MISS\"]]],\"coord\",[\"A\",\"4\"],\"result\",\"MISS\"]],\"coord\",[\"H\",\"5\"]]],\"coord\",[\"C\",\"5\"],\"result\",\"HIT\"],\"coord\",[\"J\",\"4\"],\"result\",\"HIT\"],\"result\",\"HIT\",\"coord\",[\"E\",\"10\"]],\"coord\",[\"H\",\"5\"],\"result\",\"HIT\"]],\"coord\",[\"E\",\"9\"]]],\"result\",\"HIT\"]]],\"result\",\"MISS\",\"coord\",[\"F\",\"1\"]],\"result\",\"MISS\"]]]],\"result\",\"MISS\",\"coord\",[\"J\",\"3\"]],\"coord\",[\"I\",\"4\"],\"result\",\"HIT\"]]]],\"coord\",[\"C\",\"9\"],\"result\",\"MISS\"]],\"coord\",[\"D\",\"1\"],\"result\",\"MISS\"],\"coord\",[\"G\",\"7\"]],\"result\",\"MISS\"]],\"coord\",[\"C\",\"1\"],\"result\",\"MISS\"],\"result\",\"HIT\"],\"coord\",[\"I\",\"8\"]]]]]],\"coord\",[\"A\",\"6\"],\"result\",\"MISS\"],\"result\",\"HIT\",\"coord\",[\"G\",\"4\"]],\"coord\",[\"E\",\"10\"]],\"coord\",[\"J\",\"6\"]],\"result\",\"MISS\"]]],\"coord\",[\"G\",\"5\"],\"result\",\"MISS\"],\"coord\",[\"D\",\"9\"],\"result\",\"MISS\"]]]],\"coord\",[\"B\",\"7\"],\"result\",\"MISS\"]],\"result\",\"MISS\",\"coord\",[\"F\",\"5\"]]],\"result\",\"MISS\",\"coord\",[\"F\",\"8\"]],\"coord\",[\"B\",\"2\"],\"result\",\"HIT\"],\"result\",\"MISS\"],\"coord\",[\"H\",\"7\"],\"result\",\"MISS\"],\"result\",\"MISS\"],\"result\",\"MISS\"],\"coord\",[\"C\",\"1\"],\"result\",\"MISS\"],\"result\",\"HIT\",\"coord\",[\"F\",\"2\"]],\"result\",\"MISS\"],\"result\",\"MISS\",\"coord\",[\"B\",\"7\"]],\"coord\",[\"B\",\"9\"],\"result\",\"MISS\"],\"result\",\"HIT\",\"coord\",[\"J\",\"7\"]],\"result\",\"MISS\",\"coord\",[\"A\",\"5\"]]]]],\"result\",\"MISS\",\"coord\",[\"G\",\"1\"]],\"result\",\"MISS\"],\"coord\",[\"E\",\"8\"],\"result\",\"HIT\"],\"result\",\"MISS\"],\"coord\",[\"I\",\"2\"]],\"coord\",[\"F\",\"3\"],\"result\",\"MISS\"],\"result\",\"MISS\",\"coord\",[\"H\",\"10\"]],\"result\",\"MISS\",\"coord\",[\"F\",\"10\"]],\"coord\",[\"H\",\"4\"],\"result\",\"HIT\"],\"coord\",[\"A\",\"6\"],\"result\",\"MISS\"],\"result\",\"HIT\",\"coord\",[\"H\",\"8\"]]],\"coord\",[\"B\",\"4\"]]],\"coord\",[\"H\",\"1\"],\"result\",\"MISS\"]"
type Move = (Char, Int, Bool) -- cordX, cordY, result

defaultMove :: Move
defaultMove = ('X', -1, False)

-- functions
deleteQuotes :: String  ->   String 
deleteQuotes m =
    let
        count = length $ filter (== '"') m
        modifiedMsg = filter (/= '"') m
        in
            if count `mod` 2 == 0 
                then  modifiedMsg
                else  "not even number of quotes"
          
                      
score :: String -> Either String (Int, Int)
score msg1 =
   let
       msg = deleteQuotes msg1
       moves = fromRight [] (parseMove msg (-1) [])
       in
           if isRight (parseMove msg (-1) [])
               then Right $ countScore moves 0 0
               else Left $ fromLeft ("error") (parseMove msg (-1) [])

countScore :: [Move] -> Int -> Int -> (Int, Int)
countScore [] scoreA scoreB = (scoreA, scoreB)
countScore moves scoreA scoreB =
   let
       (move:rest) = moves
       (_,_,result) = move
       total = length moves
       in
           if result == True
               then if total `mod` 2 == 1
                   then countScore rest (scoreA+1) scoreB
                   else countScore rest scoreA (scoreB+1)
               else countScore rest scoreA scoreB


parseItem :: String -> (String, String) -- for parsing one element
parseItem m =
   let
       first = takeWhile (/= ',') m
       intLength = length first + 1 
       rest = drop intLength m
       in (first, rest)
 
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
       in if (x >= 'A' && x <= 'J' && y >= 1 && y <= 10)
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
 