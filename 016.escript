#!/usr/bin/env erlang

power(_, 0) ->
    1;
power(X, N) ->
    X * power(X, N - 1).

conv($0) ->
    0;
conv($1) ->
    1;
conv($2) ->
    2;
conv($3) ->
    3;
conv($4) ->
    4;
conv($5) ->
    5;
conv($6) ->
    6;
conv($7) ->
    7;
conv($8) ->
    8;
conv($9) ->
    9.

main(_) ->
    io:format(integer_to_list(lists:sum(lists:map(fun(X) -> conv(X) end, integer_to_list(power(2, 1000)))))),
    io:format("\n"),
    halt(0). % 1366

%% ~/Projects/Project-Euler-Solutions $ escript 016.escript 
%% 1366
%% ~/Projects/Project-Euler-Solutions $ 
