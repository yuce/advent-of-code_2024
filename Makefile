
# TODO: automatic targets

PHONY: day1 day2 day3

day1:
	erlc day1.erl
	erl -noshell -eval "day1:main(), init:stop()"

day2:
	erlc day2.erl
	erl -noshell -eval "day2:main(), init:stop()"
	
day3:
	erlc day3.erl
	erl -noshell -eval "day3:main(), init:stop()"
	
