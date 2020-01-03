module Parser where

import Data.Char

data Result = Miss | Hit deriving (Show, Eq)

data Message = Message {
    coord :: Maybe (String, String),
    result :: Maybe Result,
    prev :: Maybe Message
} deriving (Show, Eq)


emptyMessage :: Message
emptyMessage = Message {coord = Nothing, result = Nothing, prev = Nothing}


parse :: String -> Either String Message
parse "" = Right emptyMessage
parse str =
    case result of
        Left errorMsg -> Left errorMsg
        Right (message, "") -> Right message
        _ -> Left "String must have only one element that is a dictionary at the top level"
    where
        result = parseDict (deleteQuotes str)
parseDict :: String -> Either String (Message, String)
parseDict ('[' : str) = parseDictElement str emptyMessage
    where
        parseDictElement :: String -> Message -> Either String (Message, String)
        parseDictElement (']' : rest) message = Right (message, rest)
        parseDictElement dictStr message =
            case parseStr dictStr of
                Left errorMsg -> Left errorMsg
                Right (parsedKey, rest) ->
                    case parseDictElementByKey parsedKey rest message of
                        Left errorMsg -> Left errorMsg
                        Right (messageAfterElementParse, restAfterElementParse) ->
                            case parseDictElement restAfterElementParse messageAfterElementParse of
                                Left errorMsg -> Left errorMsg
                                Right (message, rest) -> Right (message, rest)
parseDict _ = Left "[ expected in the beginning of a dictionary"


parseDictElementByKey :: String -> String -> Message -> Either String (Message, String)
parseDictElementByKey key str message =
    case key of
        "coord" -> parseDictCoord str message
        "result" -> parseDictResult str message
        "prev" -> parseDictPrev str message
        _ -> Left $ "Unknown key " ++ key ++ " found in dictionary"


parseDictCoord :: String -> Message -> Either String (Message, String)
parseDictCoord str message =
    case returnCoord str of
        Left errorMsg -> Left errorMsg
        Right (coordL, coordN, rest) -> Right (message {coord = Just (coordL, coordN)}, rest)


returnCoord :: String  -> Either String (String, String, String)
returnCoord m  =
   let
       (cordX, cordY, rest) = getCoords m
       (x:_) = cordX
       y = read cordY
       in if x >= 'A' && x <= 'J' && y >= 1 && y <= 10
           then Right (cordX, cordY, rest)
           else Left ("Coord values is undefined x=" ++ show cordX ++ " y=" ++ show cordY)


getCoords :: String -> (String, String, String) -- for parsing cords array
getCoords ('[':m) =
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


parseDictResult :: String -> Message -> Either String (Message, String)
parseDictResult str message =
    case getResult str of
        Left errorMsg -> Left errorMsg
        Right (parsedValue, rest) ->
            case parsedValue of
                "HIT" -> Right (message {result = Just Hit}, rest)
                "MISS" -> Right (message {result = Just Miss}, rest)
                _ -> Left ("Unknown result value " ++ parsedValue)


getResult :: String ->Either String (String, String) -- for parsing one element
getResult m =
   let
       first = takeWhile (\x -> x/= ',' && x/=']') m
       intLength = length first
       rest = drop intLength m
       symbol = head rest
      in
         if symbol ==','
            then Right(first, drop 1 rest)
         else Right(first, rest)

parseDictPrev :: String -> Message -> Either String (Message, String)
parseDictPrev str message =
    case parseDict str of
        Left errorMsg -> Left errorMsg
        Right (prevMessage, rest) -> Right (message {prev = Just prevMessage}, rest)

parseStr :: String -> Either String (String, String) -- for parsing one element
parseStr (',': rest) = parseStr rest
parseStr m =
     let
         first = takeWhile (/= ',') m
         intLength = length first + 1
         rest = drop intLength m
         in Right (first, rest)

deleteQuotes :: String  ->   String
deleteQuotes m =
    let
        count = length $ filter (== '"') m
        modifiedMsg = filter (/= '"') m
        in
            if count `mod` 2 == 0
                then  modifiedMsg
                else  "not even number of quotes"

