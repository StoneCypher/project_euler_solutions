
-module(euler).
-compile(export_all).





%% @doc If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
%%
%% Find the sum of all the multiples of 3 or 5 below 1000.

p1() ->

    lists:sum([ I || I <- lists:seq(1,999), I rem 3 == 0 orelse I rem 5 == 0 ]).





%% @doc Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
%%
%% 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
%%
%% By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

p2() ->

  Fibs = p2fib([], 1, 2),
  lists:sum([EvenFib || EvenFib <- Fibs, p2even(EvenFib) ]).





p2fib(List, A, _B) when A > 4000000 ->

    lists:reverse(List);

p2fib(List, A, B) ->

    p2fib([A] ++ List, B, A+B).

p2even(X) ->

    X rem 2 == 0.