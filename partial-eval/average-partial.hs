-- average accepts three integers and cacluates the average
-- in: Integer, Integer, Integer
-- out: Integer
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
