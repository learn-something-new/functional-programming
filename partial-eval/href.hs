-- buildURI creates a proper URI including protocol, host, port, and page
-- in: protocol (string), host (string), port (integer), page (string)
-- out: valid URI
buildURI :: String -> String -> Integer -> String -> String
buildURI a b c d = a ++ "://" ++ b ++ ":" ++ show c ++ "/" ++ d

-- addProtocol creates a partial evaluation of buildURI with with an already 
-- defined protocol
-- in: protocol (string)
-- out: (string, integer, string, string)
addProtocol :: String -> (String -> Integer -> String -> String)
addProtocol a = buildURI a

-- finishURI creates a proper URI by passing the missing parameters to buildURI
-- in: host (string), port (integer), page (string)
-- out: valid URI
finishURI :: (String -> Integer -> String -> String)
finishURI = addProtocol "http"

main =
    print (finishURI "localhost" 80 "index.html")
