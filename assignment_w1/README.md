# Pulling it all together
The following exercises are designed to demonstrate that you understand how pattern matching can be used, both in function bodies and to differentiate between clauses.

The aim is to familiarise you with writing Erlang programs using more complex pattern matching, as well as contrasting direct and tail recursion.

You’ll get a chance to to give other learners feedback on their work, as well as getting feedback on your own. The guidelines below indicate what we would like you to do do in your own work and look for in others’. To include a comment in your Erlang code use the % symbol: this makes the remainder of the line into a comment, as in

```
%%this is a comment
-module(ex).
f(0) -> 0;
f(N) -> N + f(N-1). % non-zero case
```

**Be aware** that formatting functions are limited in this platform. You may prefer to use the assignment submission box just to present commentary on your submission (for example why you chose a particular approach, or any difficulties you found) and include within that submission a link to your actual assignment, using a file service of your choice such as Dropbox or Google Drive.

**Please note:** you will not be able to edit your work after clicking ‘Submit’, so please check it carefully before submitting.

## Shapes
Define a function perimeter/1 which takes a shape and returns the perimeter of the shape.

Choose a suitable representation of triangles, and augment area/1 and perimeter/1 to handle this case too.

Define a function enclose/1 that takes a shape an returns the smallest enclosing rectangle of the shape.

## Summing the bits
Define a function bits/1 that takes a positive integer N and returns the sum of the bits in the binary representation. For example bits(7) is 3 and bits(8) is 1.

See whether you can make both a direct recursive and a tail recursive definition.

Which do you think is better? Why?

### ASSIGNMENT GUIDELINES
The reviewers will be asked to give you feedback on the following aspects of your assignment, so you should consider these when writing:

- Ensure that the solution is correct; perhaps include some tests to show how a function works in a number of representative cases.
- Ensure that the solution is readable; for example by including comments that explain how the functions work, and indicate any particular aspects that need explanation.
- Comment on any potential alternative approaches that may have been considered, and why the one chosen is the most appropriate.
