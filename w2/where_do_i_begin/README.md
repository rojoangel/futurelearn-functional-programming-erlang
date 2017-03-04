# Where do I begin?
There are usually multiple different strategies for solving problems using Erlang. In this activity, we’ll set out some of these through a series of examples.

For each of these, you’ll get a chance to try solving for yourself before I discuss a solution.

We’ll start with the take function described in the video - have a go at defining take for yourself. You could share your approach to this problem, and discuss with others, using the comments for this step.

## The 'take' function

Define a function take that takes the first N elements from a list. Here are some examples of take in action:

- take(0,"hello") = []

- take(4,"hello") = "hell"

- take(5,"hello") = "hello"

- take(9,"hello") = "hello"

## The 'nub' function

Define a function nub to remove all the duplicate elements from a list. This could remove all repeated elements except the first instance, or all repeated elements except the final instance.

- nub([2,4,1,3,3,1]) = [2,4,1,3]

- nub([2,4,1,3,3,1]) = [2,4,3,1]