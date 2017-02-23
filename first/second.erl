-module(second).
-export([hypotenuse/2]).

hypotenuse(A,B)->
    math:sqrt(first:square(A) + first:square(B)).