
-module(euler).
-compile(export_all).




%% @doc Utility to get the head element of a list

head([Head|_RestOfList]) ->

    Head.





%% @doc If we list all the natural numbers below 10 that are multiples of 3 or 
%% 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
%%
%% Find the sum of all the multiples of 3 or 5 below 1000.
%%
%% <hr>
%%
%% So, make a filter that gives the either-criterion for multiplehood 
%% `I rem 3 == 0 orelse I rem 5 == 0', then apply in a list comprehension
%% over the sequence generator from 1 &hellip; 99, then sum the result.
%%
%% ```p1() ->
%%
%%     lists:sum([ I || I <- lists:seq(1,999), I rem 3 == 0 orelse I rem 5 == 0 ]).
%% '''

p1() ->

    lists:sum([ I || I <- lists:seq(1,999), I rem 3 == 0 orelse I rem 5 == 0 ]).





%% @doc Each new term in the Fibonacci sequence is generated by adding the 
%% previous two terms. By starting with 1 and 2, the first 10 terms will be:
%%
%% 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
%%
%% By considering the terms in the Fibonacci sequence whose values do not exceed four 
%% million, find the sum of the even-valued terms.
%%
%% <hr>
%%
%% Generate the fibonacci list and terminate when the small number is over 4 million.  
%% List sum the list comprehension of the fib list with a filter for evenness.
%%
%% ```p2() ->
%%
%%   Fibs = p2fib([], 1, 2),
%%   lists:sum([EvenFib || EvenFib <- Fibs, p2even(EvenFib) ]).'''

p2() ->

  Fibs = p2fib([], 1, 2),
  lists:sum([EvenFib || EvenFib <- Fibs, p2even(EvenFib) ]).





p2fib(List, A, _B) when A > 4000000 ->

    lists:reverse(List);

p2fib(List, A, B) ->

    p2fib([A] ++ List, B, A+B).

p2even(X) ->

    X rem 2 == 0.





%% @doc The prime factors of 13195 are 5, 7, 13 and 29.
%%
%% What is the largest prime factor of the number 600851475143 ?
%%
%% <hr>
%%
%% So basically, prime factorize a bigint, sort the factors, and provide the 
%% largest.  Luckily erlang has native bignum, and luckier still, I already
%% implemented factorize in 
%% <a href="https://github.com/StoneCypher/scutil.github.com/">scutil</a>.
%%
%% So, implementation cribbed.  First of (reverse of (sort of (factorize num))).
%%
%% ```p3() ->
%%
%%     lists:head(lists:reverse(lists:sort(p3factorize(600851475143)))).'''
%%
%% p3factorize/1 is <a href="https://github.com/StoneCypher/scutil.github.com/blob/master/src/sc.erl#L3421">`sc:factorize/1'</a>

p3() ->

    head(lists:reverse(lists:sort(p3factorize(600851475143)))).





p3factorize(N)

    when 
        is_integer(N),
        N > 1 
    ->

    p3factorize(N, 2, [], math:sqrt(N));





p3factorize(1) ->

    [1];





p3factorize(0) ->

    {error, "The factorization of 0 is undefined."}.





p3factorize(N, Current, Work, Cap) ->

    case Current > Cap of

        true ->
            case N of
                1 -> lists:reverse( Work);
                _ -> lists:reverse([N] ++ Work)
            end;

        false ->
            case N rem Current of
                0 -> p3factorize(N div Current, Current, [Current] ++ Work, Cap);
                _ -> p3factorize(N, Current+1, Work, Cap)
            end

    end.
