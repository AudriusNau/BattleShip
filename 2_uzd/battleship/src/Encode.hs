module Encode where

import Parser


messageToJson :: Message -> String
messageToJson Message {coord = currentCoord, result = prevResult, prev = prevMessage}
  = "[" ++ (messageCoordToJson currentCoord) ++  (messageResultToJson prevResult) ++  (messagePrevToJson prevMessage) ++ "]"

messageCoordToJson :: Maybe (String, String) -> String
messageCoordToJson Nothing = "\"coord\",[]"
messageCoordToJson (Just (coordX, coordY)) = "\"coord\",[\"" ++ coordX ++  "\",\"" ++ coordY ++ "\"]"

messageResultToJson :: Maybe Result -> String
messageResultToJson Nothing = ""
messageResultToJson (Just Hit) = ",\"result\",\"HIT\","
messageResultToJson (Just Miss) = ",\"result\",\"MISS\","

messagePrevToJson :: Maybe Message -> String
messagePrevToJson Nothing = ""
messagePrevToJson (Just prev) = "\"prev\"," ++ messageToJson prev
