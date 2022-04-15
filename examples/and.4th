\ And tests

\ simulated inputs
: I1 true  ;
: I2 false ;

\ outputs
: O1 ." O1=" . ;
: O2 ." O2=" . ;

: test-and->true
    ||- -| I1 |- -| I2 /|- -( O1 )- -|| ;
test-and->true

: test-and->false
    ||- -| I1 |- -| I2 |- -( O1 )- -|| ;
test-and->false
