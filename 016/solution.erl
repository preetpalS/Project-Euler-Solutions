
-module(solution).
-export([solution/0]).

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

solution() ->
    lists:sum(lists:map(fun(X) -> conv(X) end, integer_to_list(power(2, 1000)))). % 1366


%% Eshell V8.0  (abort with ^G)
%% 1> erlang:system_info(otp_release).
%% "19"
%% 2> c(solution).
%% {ok,solution}
%% 3> solution:solution().
%% 1366
%% 4> halt().
