[![GitHub license](https://img.shields.io/github/license/obihann-learning/functional-programming.svg)](https://github.com/obihann-learning/functional-programming/blob/master/LICENSE)

# Lamba Expressions

Lambda expressions, or anonymous functions, are not a concept unique to functional programming. However, functional programming uses lambda expressions in concepts.
Lambda expressions are functions not bound to an identifier, a common example of this is in-line functions. In functional programming these are used
in techniques such as currying, and high-order functions.

> Source: [lambda.hs](lambda.hs)

```javascript
// findSum accepts two variables and a function
// combining the two variables and passing that 
// into the passed function
function findSum(x, y, cb) {
    var result = x + y;
    cb(result);
}

// here we call findSum passing two numbers and a 
// lambda function that creates an alert box showing
// the sum
findSum(1, 2, function(x) {
    window.alert(x);
});
```

> Source: [lambda.js](lambda.js)


A side note on the above example, as you can see in the callback we are triggering a window.alert() action. This is what is considered
a side-effect, and it is because of this, that this function is not a true functional example. Writing true functional code is 
impractical under most circumstances, however the concepts can be applied every day.

```haskell
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
```

##License
This tool is protected by the [GNU General Public License v2](http://www.gnu.org/licenses/gpl-2.0.html).

Copyright [Mark McKenna](https://github.com/markmckenna), [Jeffrey Hann](http://jeffreyhann.ca/) 2015
