[![GitHub license](https://img.shields.io/github/license/obihann-learning/functional-programming.svg)](https://github.com/obihann-learning/functional-programming/blob/master/LICENSE)

# Functional Programming

In this suite of documents we discuss functional programming: What it looks like, how it works, and what it's good for.  We try to do this from a practical-but-fun perspective, showing examples of functional programming in conventional languages, and (most importantly) how functional programming can complement object-oriented programming.

## Table of Contents

+ [Partial Evaluation](/partial-eval)
+ [Memoization (Coming soon)](#)
+ [Currying (Coming soon)](#)
+ [Recursion (Coming soon)](#)
+ [Lambda Expressions (Coming soon)](#)
+ [Reactive Programming (Coming soon)](#)
+ [Object-oriented and Functional programming](/object-oriented)
+ [Closures (Coming soon)](#)

## [Partial Evaluation](/partial-eval)

Partial evaluation is, in very basic terms, a way to call a function that takes multiple arguments while 
providing a fewer arguments than required. The result will be a new function that now accepts the number of remaining arguments. 

This can be repeatedly done until you have provided all the arguments, and unlike just creating a wrapper as you might in 
non-functional languages, a true functional language will automatically create this function by partially evaluating the function you 
are calling and determining what parameters are provided.

## Memoization

## Currying

## Recursion

## Lamba Expressions

## Reactive Programming

## [Object-oriented and Functional programming](/object-oriented)

Often, programmers consider OO and functional programming to be competing metaphors, in competition with one another.  I believe that this isn't the case; I think they complement each other; in fact, I believe they can't live without each other.

A basic human language sentence is described by linguists as being made up of a 'noun phrase' and a 'verb phrase'.  A *noun phrase* is one or more words that describe an object, such as a person, place, thing or idea; a *verb phrase* is one or more words that describe an action.  Of course the line between these can be flexible: nouns can often be 'verbified' (to bag, to box, to objectify... to verbify), and verbs are frequently nounified (runner, actor, dancer).

Similarly, programs are generally comprised of structures built out of nouns (variables, constants, fields, properties, structs, records, objects, serial forms, files, etc) and verbs (create, execute, operate, implement, extend, generate, compute, invoke, etc).  Also in keeping with human languages, verbs are nounified (creator, executor, operator, etc) and, occasionally, nouns are verbified (to serialize).

## Closures

##License
This tool is protected by the [GNU General Public License v2](http://www.gnu.org/licenses/gpl-2.0.html).

Copyright [Jeffrey Hann](http://jeffreyhann.ca/) 2015
