# Variables and patterns in practice
The aim of this exercise is to give you experience of writing functions using pattern matching in Erlang, as well as to do some “hand calculation” too.

You can solve all of these questions just using pattern matching – in particular you don’t need any other mechanism for distinguishing between different cases.

We’ll provide some feedback for these exercises in the next step, but when you have completed the step, maybe you would like to discuss your approach, and compare it with what other learners have done, in the comments for this step?

## Exclusive or
In the previous video step on pattern matching we saw two ways of defining “exclusive or”. Give at least three others. You might find it useful to know that:

=/= and == are the operations for inequality and equality in Erlang;

not is the Erlang negation function; and,

and and or are the Erlang conjunction and disjunction (infix) operators.

## Maximum of three
Give a definition of the function maxThree which takes three integers and returns the maximum of the three. You can use the max function, which gives the maximum of two numbers, in writing your definition.

maxThree(34,25,36) = 36

## How many equal?
Give a definition of the function howManyEqual which takes three integers and returns an integer, counting how many of its three arguments are equal, so that:

howManyEqual(34,25,36) = 0
howManyEqual(34,25,34) = 2
howManyEqual(34,34,34) = 3

