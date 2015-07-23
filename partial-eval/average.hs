-- average accepts three integers and cacluates the average
-- in: Integer, Integer, Integer
-- out: Integer
average :: Integer -> Integer -> Integer -> Integer
average x y z = (x + y + z) `div` 3

main = print (average 1 2 3)
