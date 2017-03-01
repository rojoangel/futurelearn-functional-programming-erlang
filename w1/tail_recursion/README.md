## Tail recursion
In this video we’ll look at tail recursion as an alternative approach and contrast with the nature of “direct” recursion.

Tail recursion gives us a functional version of a loop, and so we can see it as a link between how we program in Erlang and more traditional languages.

When you’ve watched the video, check that you can define functions by tail recursion in the following exercises. Do use the comments on this step to discuss the problems and solutions with each other.

## Fibonacci numbers
The Fibonacci sequence is given by 0, 1, 1, 2, 3, 5, … where subsequent values are given by adding the two previous values in the sequence.

The function fib/1 that we defined earlier is exponentially complex … ouch! Define an efficient Fibonacci function fib/3 using a tail recursion with two accumulating parameters that hold the last two Fibonacci numbers. Give a step-by-step evaluation of fib(4).

## Perfect numbers
A positive integer is perfect when it is the sum of its divisors, e.g. 6=1+2+3, 28=1+2+4+7+14.

Define a function perfect/1 that takes a positive number N and returns a boolean which indicates whether or not the number is perfect. You may well want to use an accumulating parameter to hold the sum of the divisors “so far”.

