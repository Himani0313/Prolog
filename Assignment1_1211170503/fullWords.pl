word('0') :- write('zero').
word('1') :- write('one').
word('2') :- write('two').
word('3') :- write('three').
word('4') :- write('four').
word('5') :- write('five').
word('6') :- write('six').
word('7') :- write('seven').
word('8') :- write('eight').
word('9') :- write('nine').

full_words(X):- number_chars(X,C), printout(C).

printout([N]):- word(N),!.
printout([N|Tail]):- word(N),write('-'),printout(Tail).