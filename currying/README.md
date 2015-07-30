# Currying

Currying is the concept of taking a single function that takes multiple arguments into a chained sequence
of functions that each take a single function.

Sample Code:

> As you can see this function accepts two integers and returns one this is not a curried function.

```
add :: (Integer, Integer) -> Integer
```

> This function takes one integer, followed by a function that takes an integer, and finally returns an integer, this is an example of currying.

```
add :: Integer -> Integer -> Integer
```

todo: reword below and add description of partial-evaluation vs partial-application

Currying is often confused with partial-evaluation, however the key difference is with currying you 
are not infact creating a function accepts less than the required number of arguments, you are actually
creating a chain of functions that each accept one function.

##License
This tool is protected by the [GNU General Public License v2](http://www.gnu.org/licenses/gpl-2.0.html).

Copyright [Jeffrey Hann](http://jeffreyhann.ca/) 2015
