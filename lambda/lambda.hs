-- findSum accepts two variables and a function
-- combining the two variables and passing that 
-- into the passed function
findSum :: Integer -> Integer -> (Integer -> Integer) -> Integer
findSum x y f = (f(x+y)) 

main = 
    -- here we are calling findSum and passing two variables
    -- and an anonymous function that accepts one variable
    -- then doubles it
    print(findSum 2 3 (\x -> x * 2))
