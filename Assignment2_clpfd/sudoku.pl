:- use_module(library(clpfd)).

sudoku(Rows) :-
    	Rows = [A,B,C,D,E,F,G,H,I],setRows(Rows),
    	transpose(Rows, Columns), setColumns(Columns),
        length(Rows, 9), maplist(same_length(Rows), Rows),
        blocks(A, B, C), blocks(D, E, F), blocks(G, H, I),
    	flatten(Rows,Vars), label(Vars).
setRows([]).
setRows([Row|Rest]) :- 
    	length(Row,9), Row ins 1..9, all_distinct(Row), setRows(Rest).

setColumns([]).
setColumns([Col|Rest]) :- 
    	length(Col,9), Col ins 1..9, all_distinct(Col), setColumns(Rest).

blocks([], [], []).
blocks([A,B,C|Bs1], [D,E,F|Bs2], [G,H,I|Bs3]) :-
        all_distinct([A,B,C,D,E,F,G,H,I]),
        blocks(Bs1, Bs2, Bs3).

problem(1, [[_,_,6, 5,9,_, _,_,_],
 [_,_,3, _,_,_, _,7,_],
 [_,_,_, _,_,_, 5,6,_],
 [_,2,_, 1,7,_, _,_,_],
 [4,8,5, _,_,_, _,_,_],
 [_,6,_, _,_,4, 9,_,_],
 [2,_,_, _,_,5, _,_,8],
 [_,3,8, _,_,1, _,_,_],
 [_,_,_, 3,_,_, 7,5,4]]).