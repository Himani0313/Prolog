neighbour(X,Y,Map) :-  member([X,Y],Map) ; member([Y,X],Map). 


findareas([],R,R). 
findareas([[X,Y]|P], R,H) :- 
 (member(X,R) ->  
  (member(Y,R) -> findareas(P,R,H) ; findareas(P,[Y|R],H)) ; 
   (member(Y,R) -> findareas(P,[X|R],H) ; findareas(P,[X,Y|R],H) ) ). 


color(Map,Colors,Coloring) :-
        findareas(Map,[],Regions), 
        colorareas(Regions,Colors,Coloring), 
        \+ conflict(Map,Coloring). 
colorareas([R|Rs],Colors,[[R,C]|A]) :- 
        member(C,Colors), 
        colorareas(Rs,Colors,A). 
colorareas([],_,[]). 


conflict(Map,Coloring) :- 
        member([R1,C],Coloring), 
        member([R2,C],Coloring), 
        neighbour(R1,R2,Map). 

		
color_map(L) :- color([[1,2],[1,3],[1,4],[1,6],[2,3],[2,5],[3,4],[3,5],[3,6],[4,5],[4,6]],[red,green,blue,yellow],L).