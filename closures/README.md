[![GitHub license](https://img.shields.io/github/license/obihann-learning/functional-programming.svg)](https://github.com/obihann-learning/functional-programming/blob/master/LICENSE)

# Closures

The concept of closure is the concept of letting a function have access to things that are scoped around it, and tying the lifetime of those things to the lifetime of the function. 

```javascript
// findAverage is a closure which accepts two variables, caculates the average
// then passes the result to a callback function
function findAverage(x, y, cb) {
    // findSum is inside a closure so it already has acccess to x and y
    // it combines the two variables and returns the result
    function findSum() {
        return x + y;
    }

    var result = fundSum() / 2;

    cb(result);
}

findAverage(1, 2, function(x) {
    window.alert(x);
});
```

##License
This tool is protected by the [GNU General Public License v2](http://www.gnu.org/licenses/gpl-2.0.html).

Copyright [Mark McKenna](https://github.com/markmckenna), [Jeffrey Hann](http://jeffreyhann.ca/) 2015
