
vaild_queen(Col) :-
    Range = [1, 2, 3, 4, 5, 6, 7, 8],
    member(Col, Range).

vaild_board([]).
vaild_board([Head|Tail]) :-
    vaild_queen(Head),
    vaild_board(Tail).

diags1([], []).
diags1(
    [
        Col|QueensTail
    ],
    [
        Diagonal|DiagonalTails
    ]
) :-
    length(QueensTail, Length),
    Row is 8 - Length,
    Diagonal is Col - Row,
    diags1(QueensTail, DiagonalTails).

diags2([], []).
diags2(
    [
        Col|QueensTail
    ],
    [
        Diagonal|DiagonalTails
    ]
) :-
    length(QueensTail, Length),
    Row is 8 - Length,
    Diagonal is Col + Row,
    diags2(QueensTail, DiagonalTails).

writeln(T) :- write(T), nl.

eight_queens(Board) :-
    /* 
    write('please type eight queens:\n'),
    read(Board),
    write('<< proccess start >>'), 
    */
    Board = [
        _, _, _, _, _, _, _, _
    ],
    vaild_board(Board),
    diags1(Board, Diags1),
    diags2(Board, Diags2),

    fd_all_different(Board),
    fd_all_different(Diags1),
    fd_all_different(Diags2).