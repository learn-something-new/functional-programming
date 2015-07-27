[![GitHub license](https://img.shields.io/github/license/obihann-learning/functional-programming.svg)](https://github.com/obihann-learning/functional-programming/blob/master/LICENSE)

# [Memoization](/memoization)

Given an operation whose arguments completely determine its output, repeated calls to that operation with the same arguments will always produce the same output.  Memoization is a programming technique that takes advantage of this by recording the result of each invocation of an operation against the given arguments, and, when given the same arguments again, returns the stored result instead of invoking the operation again.

Memoization implements a space/time tradeoff: storing the result of each invocation takes up memory (`[number of distinct calls] x [size of output type]`), but eliminates the cost of repeated calls almost entirely (and increasing the cost of non-repeated calls slightly).  The traditional memoizer monitors all arguments and stores all results, but small variations can allow for heuristics like most-recently-used to 'split the difference'.

Memoization is easy to implement for code written in functional style; in many languages it can be implemented as a completely generic 'adapter' that can be applied to any function call site.

Pseudocode:

```
define memoize(f):
    return a new function g such that:
        g takes the same arguments as f;
        g returns the same result as f;
        if g[args] is not defined, let g[args] = f(args);
        return g[args].
```

## Examples

The following is a very simple example in Python. 

```python
# Define a function memoize that takes a function, and returns a function
def memoize(f):
    memo = {}
    def delegate(*args):            # Delegate function:
        if not args in memo:        #   If we don't have a stored value yet
            memo[args] = f(*args)   #       Call f and store the value
        return memo[args]           #   Return the stored value
    return delegate                 # Return the delegate

# Define a marginally nontrivial function
def buildURI(a, b, c, d):
    return a + "://" + b + ":" + `c` + "/" + d

# Rebind the function with its own memoized version
buildURI = memoize(buildURI)

print(buildURI("http", "localhost", 80, "index.html"))      # This calls the real buildURI()
print(buildURI("http", "localhost", 80, "index.html"))      # This does not

# Because Python does late binding, this will work even for memoizing intermediate
# values of recursive functions
```

> Source: [memo.py](memo.py)

As mentioned, the above example is not very efficient, and since it is written in a non-functional language
you are limited to how much of the concept you can leverage. Next is an example in Haskell that makes use of 
State Maps and Monads to optimize the memoization. 

Since Haskell is a functional language, not Object Orientated, we don't use a class like our above example.
Instead we a function that manages our State Map, and a type of wrapper function around `times` called `timesM` that 
accepts a monad and by itself stores some pre-calculated results.

```haskell
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
```

> Source: [memo.hs](memo.hs)

##License
This tool is protected by the [GNU General Public License v2](http://www.gnu.org/licenses/gpl-2.0.html).

Copyright [Jeffrey Hann](http://jeffreyhann.ca/) 2015
