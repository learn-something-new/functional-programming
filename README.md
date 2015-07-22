[![GitHub license](https://img.shields.io/github/license/obihann-learning/functional-programming.svg)](https://github.com/obihann-learning/functional-programming/blob/master/LICENSE)

# Functional Programming

## Table of Contents

+ [Partial Evaluation](/partial-eval)
+ [Memoization (Coming soon)](#)
+ [Currying (Coming soon)](#)
+ [Recursion (Coming soon)](#)
+ [Lambda Expressions (Coming soon)](#)
+ [Reactive Programming (Coming soon)](#)

## Partial Evaluation

Partial evaluation is, in very basic terms, a way to call a function that takes mutiple arguments while providing a fewer arguments than required. The result will be a new function that now accepts the number of remaining arguments. This can be repeatedly done until you have provided all the arguments, and unlike just creating a wrapper as you might in non-functional languages, a true functional language will automatically create this function by partially evaluating the function you are calling and determining what parameters are provided.

Lets see how this might work in Haskell:

    average :: Integer -> Integer -> Integer -> Integer
    average x y z = (x + y + z) `div` 3
    
    main = print (average 1 2 3)
    
    
So what were doing here is pretty basic, creating a new function that accepts three numbers, adds them, and returns the average. We then execute the function providing all three numbers. But what if we don't know all three numbers right away, in that case we can do something like this:

    average :: Integer -> Integer -> Integer -> Integer
    average x y z = (x + y + z) `div` 3
    
    first = average 1
    second = first 2
    third = second 3
    
    main = print third
    
As you can see we are calling `average` with only one parameter, and storing the results in a value. Since we only provided one parameter the results will be apartially evaluated function, isntead of a computed value. Again when we call `first` and pass it one variable we will recieve another partially evaluated function. Finally when we call `third` passing the final value, we will recieve the computed value.

## Memoization

## Currying

## Recursion

## Lamba Expressions

## Reactive Programming

##License
This tool is protected by the [GNU General Public License v2](http://www.gnu.org/licenses/gpl-2.0.html).

Copyright [Jeffrey Hann](http://jeffreyhann.ca/) 2015
