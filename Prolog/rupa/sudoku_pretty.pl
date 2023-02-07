transpose([], []).
transpose([F|Fs], Ts) :-
    transpose(F, [F|Fs], Ts).

transpose([], _, []).
transpose([_|Rs], Ms, [Ts|Tss]) :-
        lists_firsts_rests(Ms, Ts, Ms1),
        transpose(Rs, Ms1, Tss).

lists_firsts_rests([], [], []).
lists_firsts_rests([[F|Os]|Rest], [F|Fs], [Os|Oss]) :-
        lists_firsts_rests(Rest, Fs, Oss).

/* 
transpose 라이브러리를 쓰려고 했는데 gnu엔 없는것같고,
도저히 하드하게 아래처럼 일일히 할 자신이 없어서 (9*9)
소스를 가져와서 행렬 관련 처리를 했습니다
 */

valid([]).
valid([Head|Tail]) :-
    fd_all_different(Head),
    valid(Tail).

split_every(_, [], []).
split_every(N, [X|Xs], [Y|Ys]) :-
    length(Y, N),
    append(Y, L, [X|Xs]),
    split_every(N, L, Ys).  

get_boxs(Length, Solution, Boxs) :-
    Length =:= 6,
    Solution = [
        S11, S12, S13, S14, S15, S16,
        S21, S22, S23, S24, S25, S26,
        S31, S32, S33, S34, S35, S36,
        S41, S42, S43, S44, S45, S46,
        S51, S52, S53, S54, S55, S56,
        S61, S62, S63, S64, S65, S66
		],
    Box1 = [S11, S12, S13, S21, S22, S23],
    Box2 = [S14, S15, S16, S24, S25, S26],
    Box3 = [S31, S32, S33, S41, S42, S43],
    Box4 = [S34, S35, S36, S44, S45, S46],
    Box5 = [S51, S52, S53, S61, S62, S63],
    Box6 = [S54, S55, S56, S64, S65, S66],
    Boxs = [Box1, Box2, Box3, Box4, Box5, Box6].

get_boxs(Length, Solution, Boxs) :-
    Length =:= 9,
    Solution = [S11, S12, S13, S14, S15, S16, S17, S18, S19,
			S21, S22, S23, S24, S25, S26, S27, S28, S29,
			S31, S32, S33, S34, S35, S36, S37, S38, S39,
			S41, S42, S43, S44, S45, S46, S47, S48, S49,
			S51, S52, S53, S54, S55, S56, S57, S58, S59,
			S61, S62, S63, S64, S65, S66, S67, S68, S69,
			S71, S72, S73, S74, S75, S76, S77, S78, S79,
			S81, S82, S83, S84, S85, S86, S87, S88, S89,
			S91, S92, S93, S94, S95, S96, S97, S98, S99
		],
    Box1 = [S11,S12,S13,
 			S21,S22,S23,
			S31,S32,S33],
	Box2 = [S14,S15,S16,
			S24,S25,S26,
			S34,S35,S36],
	Box3 = [S17,S18,S19,
			S27,S28,S29,
			S37,S38,S39],
	Box4 = [S41,S42,S43,
 			S51,S52,S53,
			S61,S62,S63],
	Box5 = [S44,S45,S46,
			S54,S55,S56,
			S64,S65,S66],
	Box6 = [S47,S48,S49,
			S57,S58,S59,
			S67,S68,S69],
    Box7 = [S71,S72,S73,
 			S81,S82,S83,
			S91,S92,S93],
	Box8 = [S74,S75,S76,
			S84,S85,S86,
			S94,S95,S96],
	Box9 = [S77,S78,S79,
			S87,S88,S89,
			S97,S98,S99],
    Boxs = [Box1, Box2, Box3, Box4, Box5, Box6, Box7, Box8, Box9].

get_rows(Num, Origin, Rows) :-
        split_every(Num, Origin, Rows).

print_pretty([]) :- 
    format('~n~n', []).

print_pretty([Head|Tail]) :-
    format('  ~w   ', [Head]),
    print_pretty(Tail).

sudoku(Puzzle, Solution) :-
    Solution = Puzzle,

    length(Solution, Length),
    Sqrt is round(sqrt(Length)),

    get_rows(Sqrt, Solution, Rows),
    transpose(Rows, Columns),
    get_boxs(Sqrt, Solution, Boxs),

    fd_domain(Solution, 1, Sqrt),

    maplist(fd_all_different, Rows),
    maplist(fd_all_different, Columns),
    maplist(fd_all_different, Boxs),

    write('\n\n\n <sudoku> \n \n'),
    maplist(print_pretty, Rows).


/* 
    6 * 6 스도쿠
    -> sudoku([_,2,4,6,_,3,1,_,6,_,5,2,2,6,_,5,3,4,3,4,5,_,6,1,6,1,_,3,_,5,4,_,3,1,2,_], Solution).

    result:

        <sudoku> 
        
        5     2     4     6     1     3   

        1     3     6     4     5     2   

        2     6     1     5     3     4   

        3     4     5     2     6     1   

        6     1     2     3     4     5   

        4     5     3     1     2     6   

*/

/* 
    9 * 9 스도쿠 
    -> sudoku(
        [_,_,_,_,_,_,_,_,_,
        _,_,_,_,_,3,_,8,5,
        _,_,1,_,2,_,_,_,_,
        _,_,_,5,_,7,_,_,4,
        6, 3, 4, _, 9, 2, 1, 5, _,
        7, 9, 5, 4, 6, 1, _, 3, _,
        5,_,_,_,_,_,_,7,3,
        _,_,2,_,1,_,_,_,_,
        _,_,_,_,4,_,_,_,9]
        , Solution).

    result:

        <sudoku> 
 
        9     8     7     6     5     4     3     2     1   

        2     4     6     1     7     3     9     8     5   

        3     5     1     9     2     8     7     4     6   

        1     2     8     5     3     7     6     9     4   

        6     3     4     8     9     2     1     5     7   

        7     9     5     4     6     1     8     3     2   

        5     1     9     2     8     6     4     7     3   

        4     7     2     3     1     9     5     6     8   

        8     6     3     7     4     5     2     1     9   
*/