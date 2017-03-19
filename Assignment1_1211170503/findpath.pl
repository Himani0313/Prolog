edge(a,b,1).
edge(b,e,1).
edge(a,c,6).
edge(c,d,1).
edge(d,e,1).
edge(b,d,3).
edge(b,c,4).


findpath(From, To,W, [From, To]) :-
  edge(From, To, W).

findpath(From, To, W, [From|Conn]) :- 
  edge(From, ToConn, W1),
  findpath(ToConn, To, W2, Conn),
  W is W1+W2.