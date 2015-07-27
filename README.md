[![GitHub license](https://img.shields.io/github/license/obihann-learning/functional-programming.svg)](https://github.com/obihann-learning/functional-programming/blob/master/LICENSE)

# Functional Programming

[![logo](https://raw.githubusercontent.com/learn-something-new/learn-something-new.github.io/master/logo.png?v=2)](#)

In this suite of documents we discuss functional programming: What it looks like, how it works, and what it's good for.  We try to do this from a practical-but-fun perspective, showing examples of functional programming in conventional languages, and (most importantly) how functional programming can complement object-oriented programming.

## Table of Contents

+ **[Object-oriented and Functional programming](/object-oriented)**
+ **[Partial Evaluation](/partial-eval)**
+ **[Memoization](/memoization)**
+ **[Recursion](/recursion)**
+ ** [Currying](/lambda) **
+ [Lambda Expressions (Coming soon)](#)
+ [Reactive Programming (Coming soon)](#)
+ [Closures (Coming soon)](#)

## [Object-oriented and Functional programming](/object-oriented)

Often, programmers consider OO and functional programming to be competing metaphors, in competition with one another. I believe that this isn't the case; I think they complement each other; in fact, I believe they can't live without each other.

A basic human language sentence is described by linguists as being made up of a 'noun phrase' and a 'verb phrase'.  A *noun phrase* is one or more words that describe an object, such as a person, place, thing or idea; a *verb phrase* is one or more words that describe an action.  Of course the line between these can be flexible: nouns can often be 'verbified' (to bag, to box, to objectify... to verbify), and verbs are frequently nounified (runner, actor, dancer).

Similarly, programs are generally comprised of structures built out of nouns (variables, constants, fields, properties, structs, records, objects, serial forms, files, etc) and verbs (create, execute, operate, implement, extend, generate, compute, invoke, etc).  Also in keeping with human languages, verbs are nounified (creator, executor, operator, etc) and, occasionally, nouns are verbified (to serialize).

## [Partial Evaluation](/partial-eval)

Partial evaluation is, in very basic terms, a way to call a function that takes multiple arguments while 
providing a fewer arguments than required. The result will be a new function that now accepts the number of remaining arguments. 

This can be repeatedly done until you have provided all the arguments, and unlike just creating a wrapper as you might in 
non-functional languages, a true functional language will automatically create this function by partially evaluating the function you 
are calling and determining what parameters are provided.

## [Memoization](/memoization)

Given an operation whose arguments completely determine its output, repeated calls to that operation with the same arguments will always produce the same output.  Memoization is a programming technique that takes advantage of this by recording the result of each invocation of an operation against the given arguments, and, when given the same arguments again, returns the stored result instead of invoking the operation again.

Memoization implements a space/time tradeoff: storing the result of each invocation takes up memory (`[number of distinct calls] x [size of output type]`), but eliminates the cost of repeated calls almost entirely (and increasing the cost of non-repeated calls slightly).  The traditional memoizer monitors all arguments and stores all results, but small variations can allow for heuristics like most-recently-used to 'split the difference'.

Memoization is easy to implement for code written in functional style; in many languages it can be implemented as a completely generic 'adapter' that can be applied to any function call site.

## Currying

*(Coming soon)*

## [Recursion](/recursion)

See section [recursion](/recursion) for description.

## Lamba Expressions

Lambda expressions, or anonymous functions, are not a concept unique to functional programming. However, functional programming uses lambda expressions in concepts.
Lambda expressions are functions not bound to an identifier, a common example of this is in-line functions. In functional programming these are used
in techniques such as currying, and high-order functions.

## Reactive Programming

*(Coming soon)*

## Closures

*(Coming soon)*

##License
This tool is protected by the [GNU General Public License v2](http://www.gnu.org/licenses/gpl-2.0.html).

Copyright [Mark McKenna](https://github.com/markmckenna), [Jeffrey Hann](http://jeffreyhann.ca/) 2015
