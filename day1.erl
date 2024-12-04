%%% Advent of Code Day 1:
%%% see: https://adventofcode.com/2024/day/1
%%% 2024, Yüce Tekol

-module(day1).

-export([main/0]).

total_distance(Left, Right) when length(Left) == length(Right) ->
    Zipped = lists:zip(lists:sort(Left), lists:sort(Right)),
    lists:sum([abs(A - B) || {A, B} <- Zipped]).

parse_text(Text) ->
    F = fun(Line) ->
        [A, B] = string:split(string:trim(Line), "  "),
        IA = list_to_integer(string:trim(A)),
        IB = list_to_integer(string:trim(B)),
        {IA, IB}
    end,
    Pairs = lists:map(F, string:split(Text, "\n", all)),
    lists:unzip(Pairs).

main() ->
    Text = """
        3   4
        4   3
        2   5
        1   3
        3   9
        3   3
    """,
    {Left, Right} = parse_text(Text),
    Distance = total_distance(Left, Right),
    io:format("Total distance: ~p~n", [Distance]).

