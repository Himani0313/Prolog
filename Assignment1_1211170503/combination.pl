combination(1, [H|_], [H]).
combination(N, [H|T], [H|C]) :-
        N1 is N - 1,
        N1 > 0,
        combination(N1, T, C).
combination(N, [_|T], C) :- combination(N, T, C).