concat([], List, List).
concat([Head|Tail1], List, [Head|Tail2]) :-
    concat(Tail1, List, Tail2).

/* 
0. concat([1, 2], [3], What) 

1. concat([1|[2]], [3], [1|Tail2-A]):-
    concat([2], [3], [Tail2-A])

2. concat([2|[]], [3], [2|Tail2-B]) :-
    concat([], [3], Tail2-B)

    Tail2-B => 3 (첫번째 규칙이 재귀의 마침표 같은 것임. 저게 없으면 안됨)
    다시 타고 올라가서 값을 대입하면 결국 [1, 2, 3]이 나오게 됨.
*/