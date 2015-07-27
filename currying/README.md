# Currying

Currying is the concept of taking a single function that takes multiple arguments into a chained sequence
of functions that each take a single function.

Sample Code:

```
-- as you can see this function accepts two integers and returns one
-- this is not a curried function, nor is it a high order function
add :: (Integer, Integer) -> Integer

-- this function takes one integer, followed by a function that takes an 
integer, and finall returns an integer, this is an example of currying and 
-- also a high order function
add :: Integer -> Integer -> Integer
```


Currying is often confused with partial-evaluation, however the key difference is with currying you 
are not infact creating a function accepts less than the required number of arguments, you are actually
creating a chain of functions that each accept one function.

It is also worth mentioning that in languages such as haskell (which automatically curry all your functions)
currying is one of the most common higher order functions, and because the result is a high order function
because it now accepts an argument, and a function.

##License
This tool is protected by the [GNU General Public License v2](http://www.gnu.org/licenses/gpl-2.0.html).

Copyright [Jeffrey Hann](http://jeffreyhann.ca/) 2015
