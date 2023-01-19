list_min([M], M).
list_min([Head|Tail], Minimum) :-
    list_min(Tail, TailMin),
    Minimum is min(Head,TailMin).