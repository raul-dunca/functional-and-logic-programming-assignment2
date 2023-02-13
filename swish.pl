% replace(L:List , a: element to be removed, e: new element which will replace a,R: The result)
% (i,i,i,o)
replace([],_,_,[]).
replace([HA|TA],A,E,[HR|TR]):- HA == A,
    !,
    HR is E,
    replace(TA,A,E,TR).
replace([HA|TA],A,E,[HR|TR]):- HR is HA,
    replace(TA,A,E,TR).


%max(L:List, M:Var to keep max,R: The result)
%(i,i,o)
max([],M,M).
max([H|T],M,R):- number(H),
    H > M,
    !,
    max(T,H,R).
max([_|T],M,R):-max(T,M,R).

%main(L:List, R:The maximum from L) initialize M to 0
%(i,o)
main(L,R):- 
    max(L,0,R).

%max_replace(L:The List,C:The initial list, R: The result)
max_replace([],_,[]).
max_replace([H|T],L,[REZ|TR]):- 
    is_list(H),
    !,
    main(H,R),
    main(L,R2),
    replace(H,R2,R,REZ),
   	max_replace(T,L,TR).
max_replace([H|T],L,[HR|TR]):- HR is H,
    max_replace(T,L,TR).

%max(L:List, R: The result) used to be easier to call the function (with only one list)
%(i,o)
main_2(L,R):- max_replace(L,L,R).