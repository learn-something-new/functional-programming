[![GitHub license](https://img.shields.io/github/license/obihann-learning/functional-programming.svg)](https://github.com/obihann-learning/functional-programming/blob/master/LICENSE)

## [Recursion](/recursion)

In functional programming, there are no loops, instead you use recursive functions. Recursive functions work similarly to loops in that they call themselves
until a exit criteria is met.

```haskell
-- countToTen will call itself and increment X until X is 10
countToTen :: Integer -> Integer
countToTen x =
    if x < 10 then
        countToTen(x + 1)
    else
        x

main =
    print(countToTen 1)
```

> Source [recursion.hs](recursion.hs)

##License
This tool is protected by the [GNU General Public License v2](http://www.gnu.org/licenses/gpl-2.0.html).

Copyright [Mark McKenna](https://github.com/markmckenna), [Jeffrey Hann](http://jeffreyhann.ca/) 2015
