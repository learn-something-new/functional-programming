[![GitHub license](https://img.shields.io/github/license/obihann-learning/functional-programming.svg)](https://github.com/obihann-learning/functional-programming/blob/master/LICENSE)

# [Memoization](/memoization)

Memoization is the act of storing function calls in memory and returning the already computed results. This means that
when a function is first called the function call, and the results are stored, when that function is called again with 
the same parameters the stored result is returned. 

## Examples

The following is a very simple example in Python, though a non-functional language it very simply explains
how memoization can be achieved. 

What is happening below is a basic function `buildURI` that accepts the 4 basic parts of a URI and returns the complete string
is being passed in the declaration of a new object `buildURI`, of the class `Memoize`. 

This object can now be called using the exact same parameters as the original function, however during each call we check if this 
has been called previously (by storing the result in an object identified by the args array) and if it has we simply returned the 
previously computed result. 

If the array of arguments do not match anything that has been previously called, we evaluate the function as expected and
then store the results for future use.

    # Memoize allows us to store the args and value of each function call
    # and on any future calls matching the same args, we can return the value
    # without evaluating the function
    class Memoize:
        # __init__ initializes Memoize by storying the function and creating
        # an empty object for the args and values
        # in: self (Memozie), f (function)
        def __init__(self, f):
            self.f = f
            self.memo = {}
        # __call__ is evaluated on each call to the function stored in Memoize
        # and checks if the args are in the memo object, if missing we evaluate the
        # function and store the data for future uses
        # in: self (Memozie), args (list of arguments)
        # out: output of self.f
        def __call__(self, *args):
            if not args in self.memo:
                self.memo[args] = self.f(*args)
            return self.memo[args]

    # buildURI creates a proper URI including protocol, host, port, and page
    # in: protocol (string), host (string), port (integer), page (string)
    # out: valid URI
    def buildURI(a, b, c, d):
        return a + "://" + b + ":" + `c` + "/" + d

    buildURI = Memoize(buildURI)

    print(buildURI("http", "localhost", 80, "index.html"))
    print(buildURI("http", "localhost", 80, "index.html"))

> Source: [memo.py](memo.py)

As mentioned, the above example is not very efficient, and since it is written in a non-functional language
you are limited to how much of the concept you can leverage. Next is an example in Haskell that makes use of 
State Maps and Monads to optimizes the memoization. 

Since Haskell is a functional language, not Object Orientated, we use a class like our above example.
Instead we a function that manages our State Map, and a type of wrapper function around `times` called `timesM` that 
accepts a monad and by itself stores some pre-calculated results.

The real bulk of this code lives in `memoizeM` which looks complicated, however broken down it is fairly straight forward. The 
general idea is this function accepts a function(in this case `timesM`) and Show types, then returns a function that very similarly
accepts two Show types and returns one.

Here is a better breakdown:

Input:

    ((Show -> Show -> StateMap (Show Show)) -> (Show -> Show -> StateMap (Show Show)))

Output: 

    (Show -> Show -> Show)

Now as I mentioned, we are passing in `timesM`, as well as two integers. Using monads and a maybe statement we can first check if 
this exists in our map, and if not we work through evaluating it and storing it in our map.

    -- times is a simple function that accepts two numbers and multiplies them
    -- in: Integer, Integer
    -- out: Integer
    times :: Integer -> Integer -> Integer
    times a  b = a * b

    -- timesM accepts a function and a Integer, if the function matches one that
    -- has already been computed (such as `timesM 2`) then we return the already defined
    -- value, if not we compute a new value
    -- in: Integer, Integer
    -- out: Integer
    timesM :: Monad m => (Integer -> Integer -> m Integer) -> Integer -> Integer -> m Integer
    timesM f' 2 2 = return 4
    timesM f' 3 3 = return 6
    timesM f' x y = do
        return $ times x y

    type StateMap a b = State (Map a b) b

    -- memoizeM returns a function that accepts a single input and returns
    -- the value either by returning timesM or Map.lookup
    -- out: Integer -> Integer -> Integer
    memoizeM :: (Show a, Show b, Ord a) 
        => ((a -> b -> StateMap a b) -> (a -> b -> StateMap a b)) -> (a -> b -> b)
    memoizeM t x y = evalState (f x y) Map.empty where
        g x y = do
            -- assuming `f = timesM 2` and `x = 2` then y evaluates 
            -- timesM (t) and passes it `timesM 2` (f)
            -- if this is already a computed value it is returned immediately
            -- if `timesM 2` has not been computed then timesM is passed 2 (x)
            y <- t f x y
            -- m retrieves the monad from the state
            m <- get
            -- insert x y and m into the a map and then store this into the state
            put $ Map.insert x y m
            -- store the state in newM
            newM <- get
            -- return y
            return y
        f x y = get >>= \m -> maybe (g x y) return (Map.lookup x m)

    -- val is a partial evaluation of `memoizeM -> timesM -> x
    -- in: Integer, Integer
    -- out: Integer
    val :: Integer -> Integer -> Integer
    val x y = memoizeM timesM x y

    main =
        print $ val 2 2

> Source: [memo.hs](memo.hs)

##License
This tool is protected by the [GNU General Public License v2](http://www.gnu.org/licenses/gpl-2.0.html).

Copyright [Jeffrey Hann](http://jeffreyhann.ca/) 2015
