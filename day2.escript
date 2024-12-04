%%% Advent of Code Day 2:
%%% see: https://adventofcode.com/2024/day/2
%%% 2024, Yüce Tekol

-spec is_safe(Report :: list()) -> boolean().
is_safe([First|Rest]) ->
    is_safe(First, Rest, none).

is_safe(_Compare, [], _) ->
    true;

is_safe(Compare, [First| Rest], Dir) ->
    {NewDir, OKGap} = ok_gap(Compare, First),
    OKDir = ok_dir(Dir, NewDir),
    case OKGap andalso OKDir of
        true ->  is_safe(First, Rest, NewDir);
        _ -> false
    end.

ok_gap(Compare, First) ->
    % Any two adjacent levels differ by at least one and at most three.
    Diff = Compare - First,
    if
        Diff >= 1 andalso Diff =<  3 -> {inc, true};
        Diff >= -3 andalso Diff =< -1 -> {dec, true};
        true -> {none, false}
    end.

ok_dir(Dir, NewDir) ->
    % The levels are either all increasing or all decreasing.
    case {Dir, NewDir} of
        {none, _} -> true;
        {X, Y} when X == Y -> true;
        _ -> false
    end.

process_report(Report) ->
    io:format("~p is ~s~n", [Report, get_state(is_safe(Report))]).

get_state(IsSafe) ->
    case IsSafe of
        true -> "Safe";
        false -> "Unsafe"
    end.

process_report_str(ReportStr) ->
    ReportStrTrim = string:trim(ReportStr),
    Items =  string:split(ReportStrTrim, " ", all),
    Report = [list_to_integer(Item) || Item <- Items],
    process_report(Report).


main(_) ->
    Text = """
        7 6 4 2 1
        1 2 7 8 9
        9 7 6 2 1
        1 3 2 4 5
        8 6 4 4 1
        1 3 6 7 9
    """,
    ReportStrs = string:split(Text, "\n", all),
    lists:foreach(fun process_report_str/1, ReportStrs).
