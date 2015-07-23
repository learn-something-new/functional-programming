[![GitHub license](https://img.shields.io/github/license/obihann-learning/functional-programming.svg)](https://github.com/obihann-learning/functional-programming/blob/master/LICENSE)

# Functional Programming

## Table of Contents

+ [Partial Evaluation (Coming soon)](#)
+ [Memoization](/memoization)
+ [Currying (Coming soon)](#)
+ [Recursion (Coming soon)](#)
+ [Lambda Expressions (Coming soon)](#)
+ [Reactive Programming (Coming soon)](#)

## Partial Evaluation

## [Memoization](/memoization)

Given an operation whose arguments completely determine its output, repeated calls to that operation with the same arguments will always produce the same output.  Memoization is a programming technique that takes advantage of this by recording the result of each invocation of an operation against the given arguments, and, when given the same arguments again, returns the stored result instead of invoking the operation again.

Memoization implements a space/time tradeoff: storing the result of each invocation takes up memory (`[number of distinct calls] x [size of output type]`), but eliminates the cost of repeated calls almost entirely (and increasing the cost of non-repeated calls slightly).  The traditional memoizer monitors all arguments and stores all results, but small variations can allow for heuristics like most-recently-used to 'split the difference'.

Memoization is easy to implement for code written in functional style; in many languages it can be implemented as a completely generic 'adapter' that can be applied to any function call site.

Pseudocode:
```
    define memoize(f):
        return a new function g such that:
            g takes the same arguments as f;
            g returns the same result as f;
            if g[args] is not defined, let g[args] = f(args);
            return g[args].
```

## Currying

## Recursion

## Lamba Expressions

## Reactive Programming

##License
This tool is protected by the [GNU General Public License v2](http://www.gnu.org/licenses/gpl-2.0.html).

Copyright [Jeffrey Hann](http://jeffreyhann.ca/) 2015
