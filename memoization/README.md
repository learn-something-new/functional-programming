[![GitHub license](https://img.shields.io/github/license/obihann-learning/functional-programming.svg)](https://github.com/obihann-learning/functional-programming/blob/master/LICENSE)

# [Memoization](/memoization)

Memoization is the act of storing function calls in memory and returning the already computed results. This means that
when a function is first called the function call, and the results are stored, when that function is called again with 
the same parameters the stored result is returned. 

## Examples

The following is a very simple example in Python, though a non-functional language it very simply explains
how memoization can be achieved.

        # Memoize allows us to store the args and value of each function call
        # and on any future calls matching the same args, we can return the value
        # without evaluating the function
        class Memoize:
            # __init__ initializes Memoize by storying the function and creating
            # an empty object for the args and values
            # in: self (Memozie), f (function)
            def __init__(self, f):
                self.f = f
                self.memo = {}
            # __call__ is evaluated on each call to the function stored in Memoize
            # and checks if the args are in the memo object, if missing we evaluate the
            # function and store the data for future uses
            # in: self (Memozie), args (list of arguments)
            # out: output of self.f
            def __call__(self, *args):
                if not args in self.memo:
                    self.memo[args] = self.f(*args)
                return self.memo[args]

        # buildURI creates a proper URI including protocol, host, port, and page
        # in: protocol (string), host (string), port (integer), page (string)
        # out: valid URI
        def buildURI(a, b, c, d):
            return a + "://" + b + ":" + `c` + "/" + d

        buildURI = Memoize(buildURI)

        print(buildURI("http", "localhost", 80, "index.html"))
        print(buildURI("http", "localhost", 80, "index.html"))

> Source: [memo.py](memo.py)

##License
This tool is protected by the [GNU General Public License v2](http://www.gnu.org/licenses/gpl-2.0.html).

Copyright [Jeffrey Hann](http://jeffreyhann.ca/) 2015
