-- countToTen will call itself and increment X until X is 10
countToTen :: Integer -> Integer
countToTen x =
    if x < 10 then
        countToTen(x + 1)
    else
        x

main =
    print(countToTen 1)
