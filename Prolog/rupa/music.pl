musician_instrument(leo, guitar).
musician_instrument(jeo, vocal).
musician_instrument(heo, violin).
musician_instrument(iu, vocal).
musician_instrument(iuron, piano).
musician_instrument(rupa, piano).
musician_instrument(jang, piano).
musician_instrument(joel, guitar).

musician_genre(pops, leo).
musician_genre(pops, jeo).
musician_genre(jazz, heo).
musician_genre(rock, iu).
musician_genre(balad, iuron).
musician_genre(jazz, rupa).
musician_genre(jazz, jang).
musician_genre(rock, joel).

musician(X, Y, Z) :- musician_genre(X, Z), musician_instrument(Z, Y).

/* 
    ?- ['music'].

    1. 연주자를 장르나 음악을 이용해서 표현하라. (표현이 애매해서 일단 musician 제작)

    ?- musician(jazz, piano, Who).
        Who = rupa ;
        Who = jang.
*/

/* 
    2. 기타를 연주하는 사람을 모두 찾으라.

    ?- musician_instrument(What, guitar).
        What = leo ;
        What = joel.
*/