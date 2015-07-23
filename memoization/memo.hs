import Data.Map as Map
import Control.Monad.State.Lazy as State

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
