count(0, []).
count(Count, [Head|Tail]) :-
    count(TailCount, Tail), 
    Count is TailCount + 1.

/* count(What, [1, 2, 3]) */

sum(0, []).
sum(Total, [Head|Tail]) :-
    sum(Sum, Tail),
    Total is Head + Sum.
/* sum(What, [1, 2, 3]) */
