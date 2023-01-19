/* 리스트에 있는 요소의 순서를 바꾸어보라 */
reverseArr([], []).
reverseArr([Head|Tail1], Result) :-
    reverseArr(Tail1, Tail2),
    append(Tail2, [Head], Result).

/* 사용: reverseArr([1, 2], What) */
/* 
    순서
    1. reverseArr([], []).
        reverseArr([1|2], [2]) :-
        reverseArr(2, [2]),
        append([2], [1], Result).

    2. reverseArr([2, []], Result) :-
        reverseArr([], []),
        append([], 2, [2]).
    
    3. 1번에 데이터 주입

    -> [2, 1]
*/


/* 리스트에 있는 요소 중 값이 가장 작은 것을 찾으라 */

findMin([Head], Head). 
findMin([Head|Tail], Minimal) :-
    findMin(Tail, Minimal2),
    Minimal is min(Head, Minimal2).

/* 사용: findMin([1, 2], What) */

takeout(X, [X|R], R). 
/* 맨 앞에 제외하고자 하는 숫자가 있을때 */
takeout(X, [F|R], [F|S]) :- takeout(X,R,S). 
/* 맨 앞에 제외하고자 하는 숫자가 없을때 */

/* 
    1. takeout(1, [2, [4, 1, 3]], [2, 4, 3]). -> ?
    2. takeout(1, [4, [3, 1]], [4, 3]) -> ?
    2. takeout(1, [3, [1]], [3]) -> ?
    2. takeout(1, [1, []]) -> [] (첫번째 조건에 걸림)
 */

/* 리스트의 요소들을 크기 순서로 정렬하라 */
sortArr([Tail], [Tail]).
sortArr(Origin, [Minimal|Sorted]) :- 
  findMin(Origin, Minimal), 
  takeout(Minimal, Origin, Rest), 
  sortArr(Rest, Sorted).
/* 사용: sortArr([3, 2, 1], What) */