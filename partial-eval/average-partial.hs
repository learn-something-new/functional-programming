average :: Integer -> Integer -> Integer -> Integer
average x y z = (x + y + z) `div` 3

first = average 1
second = first 2
third = second 3

main = print third
