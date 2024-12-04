%%% Advent of Code Day 3:
%%% see: https://adventofcode.com/2024/day/3
%%% 2024, Yüce Tekol

-module(day3).

-export([main/0]).

extract_muls(Text) ->
    RE = "mul\\(([0-9]{1,3}),([0-9]{1,3})\\)",
    case re:run(Text, RE, [global, {capture, all, list}]) of
        {error, _} ->
            [];
        {match, Matches} ->
            [transform(Match) || Match <- Matches]
    end.

transform([_, A, B]) ->
    IA = list_to_integer(A),
    IB = list_to_integer(B),
    {IA, IB}.

main() ->
    Text = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))",
    Muls = extract_muls(Text),
    Result = lists:sum([A * B || {A, B} <- Muls]),
    io:format("Result: ~p~n", [Result]).
    
