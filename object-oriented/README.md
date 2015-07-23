[![GitHub license](https://img.shields.io/github/license/obihann-learning/functional-programming.svg)](https://github.com/obihann-learning/functional-programming/blob/master/LICENSE)

# Object-oriented and Functional Programming

Often, programmers consider OO and functional programming to be competing metaphors, in competition with one another.  I believe that this isn't the case; I think they complement each other; in fact, I believe they can't live without each other.

A basic human language sentence is described by linguists as being made up of a 'noun phrase' and a 'verb phrase'.  A *noun phrase* is one or more words that describe an object, such as a person, place, thing or idea; a *verb phrase* is one or more words that describe an action.  Of course the line between these can be flexible: nouns can often be 'verbified' (to bag, to box, to objectify... to verbify), and verbs are frequently nounified (runner, actor, dancer).

Similarly, programs are generally comprised of structures built out of nouns (variables, constants, fields, properties, structs, records, objects, serial forms, files, etc) and verbs (create, execute, operate, implement, extend, generate, compute, invoke, etc).  Also in keeping with human languages, verbs are nounified (creator, executor, operator, etc) and, occasionally, nouns are verbified (to serialize).

## Object-oriented programming

Object-oriented programming focuses heavily on nouns.  It encourages programmers to visualize and model the application in terms of the things it is comprised out of; naming, structuring and classifying all of the values being moved about.  Programmers define packages, which contain classes, which encapsulate fields, properties and methods; these components make up the state of the system.  Almost all of the application is defined in terms of manipulating objects, modifying their state in complex ways.  It favours a top-down design approach, in which a big-picture, abstract model is developed first, and then 'drilled down' on to achieve more detail.

A well-designed object-oriented system can be scalable and beautiful.  A large number of design principles have been developed which provide a lot of guidance to skilled programmers, to ensure that the systems they create will last for a long time.  Some of these principles include:

* *Don't Repeat Yourself*: Avoid duplication; share code in repositories
* *Maximize cohesion*: Every object should have a single, well-defined role
* *Minimize coupling*: Objects should reference each other as little as possible
* *Avoid circularity*: Dependencies should flow in one direction only
* *Inject dependencies*: Where objects do depend on one another, prefer externally-provided object instances over internally-constructed ones
* *Define interfaces*: Objects should only expose as much functionality as is necessary for them to do their job

Sample code:
```java
class QuickSorter<T> implements Sorter<T> {
  public void sort(List<T> list) {
    doSort(list, 0, list.size());
  }
  
  private void doSort(List<T> list, int low, int length) {
    int pivotPoint = findPivotPoint(list, low, length);
    doSort(list, 0, pivotPoint);
    doSort(list, pivotPoint, length);
  }
}
```

## Functional programming

Functional programming, on the other hand, favours verbs.  It encourages programmers to focus on what the program does, and less on how it is done: a *declarative* approach, rather than the *imperative* one that is common among object-oriented applications.  Programmers define strictly limited functions which transform their inputs into outputs.

* *No side-effects*
* *Pure functions*
* *Recursion*
* *First-class and higher-order functions*
* *Late binding*

Sample code:
```haskell
def quicksort list = join(
  each(
    split(findPivot(list)), 
    part -> quicksort(part)
  )
);
```

##License
This tool is protected by the [GNU General Public License v2](http://www.gnu.org/licenses/gpl-2.0.html).

Copyright [Jeffrey Hann](http://jeffreyhann.ca/) 2015
