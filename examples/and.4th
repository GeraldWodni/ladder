\ And tests

\ simulated inputs
: I1 true  ;
: I2 false ;

\ outputs
: O1 ." O1=" . ;
: O2 ." O2=" . ;

: test-and
    ||- -| I1 |- -| I2 /|- -( O1 )- -|| ;

