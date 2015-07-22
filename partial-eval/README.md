[![GitHub license](https://img.shields.io/github/license/obihann-learning/functional-programming.svg)](https://github.com/obihann-learning/functional-programming/blob/master/LICENSE)

# Partial Evaluation

Partial evaluation is, in very basic terms, a way to call a function that takes mutiple arguments while providing a fewer arguments than required. The result will be a new function that now accepts the number of remaining arguments. This can be repeatedly done until you have provided all the arguments, and unlike just creating a wrapper as you might in non-functional languages, a true functional language will automatically create this function by partially evaluating the function you are calling and determining what parameters are provided.

## Examples

Lets see how this might work in Haskell:

    -- average accepts three integers and cacluates the average
    -- in: Integer, Integer, Integer
    -- out: Integer
    average :: Integer -> Integer -> Integer -> Integer
    average x y z = (x + y + z) `div` 3
    
    main = print (average 1 2 3)

> source: [average.hs](average.hs)
    
So what were doing here is pretty basic, creating a new function that accepts three numbers, adds them, and returns the average. We then execute the function providing all three numbers. But what if we don't know all three numbers right away, in that case we can do something like this:

    -- average accepts three integers and cacluates the average
    -- in: Integer, Integer, Integer
    average :: Integer -> Integer -> Integer -> Integer
    average x y z = (x + y + z) `div` 3
    
    -- first passes a single integer to average and stores the 
    -- partial evaluation that is returned
    first = average 1
    
    -- second works the same way first does, passing a single integer
    -- and storing the partially evaluated result
    second = first 2

    -- third passes the final integer and stores the computed value of average
    -- which in this case is the average of all three integers being provided
    third = second 3
    
    main = print third

> source: [average-partial.hs](average-partial.hs)
    
As you can see we are calling `average` with only one parameter, and storing the results in a value. Since we only provided one parameter the results will be apartially evaluated function, isntead of a computed value. Again when we call `first` and pass it one variable we will recieve another partially evaluated function. Finally when we call `third` passing the final value, we will recieve the computed value.

### Something more practical

The average function gets the point across but it isn't the most practical. Here is another example that should help getting the concept across:

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

> source: [href.hs](href.hs)


##License
This tool is protected by the [GNU General Public License v2](http://www.gnu.org/licenses/gpl-2.0.html).

Copyright [Jeffrey Hann](http://jeffreyhann.ca/) 2015
