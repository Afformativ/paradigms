  list_ascending_rest([],[],[]).
list_ascending_rest([A],[A],[]).
list_ascending_rest([A1,A2|As], [A1], [A2|As]) :-
    A1 >= A2.
list_ascending_rest([A1,A2|As], [A1|Bs], Cs) :-
    A1 < A2,
    list_ascending_rest([A2|As], Bs,Cs).
list_ascendingParts([],[]).
list_ascendingParts([A|As],[Bs|Bss]) :-
    list_ascending_rest([A|As],Bs,As0),
    list_ascendingParts(As0,Bss).
