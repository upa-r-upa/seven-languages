
vaild_queen((Row, Col)) :-
    Range = [1, 2, 3, 4, 5, 6, 7, 8],
    member(Col, Range).

vaild_board([]).
vaild_board([Head|Tail]) :-
    vaild_queen(Head),
    vaild_board(Tail).

/* Col이 행,렬로 이루어져 있는지 체크, Col만 추출 */
cols([], []).
cols(
    [
        (_, Col)|QueensTail
    ],
    [
        Col|ColsTail
    ]
) :-
    cols(QueensTail, ColsTail).

diags1([], []).
diags1(
    [
        (Row, Col)|QueensTail
    ],
    [
        Diagonal|DiagonalTails
    ]
) :-
    Diagonal is Col - Row,
    diags1(QueensTail, DiagonalTails).


diags2([], []).
diags2(
    [
        (Row, Col)|QueensTail
    ],
    [
        Diagonal|DiagonalTails
    ]
) :-
    Diagonal is Col + Row,
    diags2(QueensTail, DiagonalTails).

writeln(T) :- write(T), nl.

eight_queens(Board) :-
    write("Hello World"),
    Board = [
        (1, _), (2, _), (3, _), (4, _), (5, _), (6, _), (7, _), (8, _)
    ],
    vaild_board(Board),

    cols(Board, Cols),
    diags1(Board, Diags1),
    diags1(Board, Diags2),

    fd_all_different(Cols),
    fd_all_different(Diags1),
    fd_all_different(Diags1).