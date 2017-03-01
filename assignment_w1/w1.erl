-module(w1).
-export([area/1, perimeter/1, enclose/1, bits/1, tbits/1]).

% {circle, {X,Y}, R}
%    - center {X,Y}
%    - radius R
%
% {rectangle, {X,Y}, H, W}
%    - lower left vertice {X,Y}
%    - height H
%    - width  W
%
% {triangle, {XA,YA}, {XB,YB}, {XC,YC}}
%   - vertices: {XA,YA}, {XB,YB}, {XC,YC}

% helper function to calculate the distance between two points
distance({X1,Y1},{X2,Y2}) -> 
    math:sqrt(math:pow(X2-X1,2) + math:pow(Y2-Y1,2)).

area({circle, {_X,_Y}, R}) -> 
    math:pi() * R * R;
area({rectangle, {_X,_Y}, H, W}) ->
    H * W;
area({triangle, {XA,YA}, {XB,YB}, {XC,YC}}) ->
    abs((XA-XC)*(YB-YA)-(XA-XB)*(YC-YA))/2.

perimeter({circle, {_X,_Y}, R}) ->
    2 * math:pi() * R;
perimeter({rectangle, {_X,_Y}, H, W}) ->
    2 * (H + W);
perimeter({triangle, {XA,YA}, {XB,YB}, {XC,YC}}) ->
    AB = distance({XA,YA},{XB,YB}),
    BC = distance({XB,YB},{XC,YC}),
    AC = distance({XA,YA},{XC,YC}),
    AB + BC + AC.

enclose({circle, {X,Y}, R}) ->
    {rectangle, {X-R,Y-R}, 2*R, 2*R};
enclose({rectangle, {X,Y}, H, W}) ->
    {rectangle, {X,Y}, H, W};
enclose({triangle, {XA,YA}, {XB,YB}, {XC,YC}}) ->
    MIN_X = min(XA, min(XB, XC)),
    MIN_Y = min(YA, min(YB, YC)),
    MAX_X = max(XA, max(XB, XC)),
    MAX_Y = min(YA, min(YB, YC)),
    {rectangle, {MIN_X,MIN_Y}, MAX_Y-MIN_Y, MAX_X-MIN_X}.

% direct recursion
bits(0) ->
    0;
bits(N) when N>0 ->
    (N rem 2) + bits(N div 2). 

% tail recursion
tbits(N) when N>=0 ->
    tbits(N, 0).

tbits(0, S) ->
    S;
tbits(N, S) when N>0 -> % N number, S accumulated sum
    tbits(N div 2, S + (N rem 2)).