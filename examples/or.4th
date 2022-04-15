\ OR tests

\ simulated inputs
: I3 true  ;
: I4 false ;

\ outputs
: O3 ." O3=" . ;
: O4 ." O4=" . ;

: test-or->true
    ||- -| I3 |- -+
    ||- -| I4 |- -+- -( O3 )- -|| ;
test-or->true

: test-or->false
    ||- -| I3 /|- -+
    ||- -| I4  |- -+- -( O4 )- -|| ;
test-or->false
