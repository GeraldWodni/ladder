\ parse for ladder logic
\ (c)copyright 2022 by Gerald Wodni <gerald.wodni@gmail.com>

variable line-open

: || ( -- )
\ *G treat the rest of the line as comment
    13 parse 2drop ;

: ||- ( -- t )
\ *G start ladder line
    line-open @ if
        abort" Line already open, possible missplaced '||-'"
    else
        line-open on
        true
    then ;

: -|| ( x -- )
\ *G end ladder line
    line-open @ if
        drop
        line-open off
    else
        abort" Line already closed, possible missplaced '-||' or '-+'"
    then ;

: -| ; ( f -- f )
\ *G Start input expression, must be closed with '|-'.
\ ** The expression can assume one flag on the stack.
\ ** The expression itself must put an extra flag on the stack.
\ *E Example: -| I1 |-

\ *S And-parsing
\ *P Logical ands always reside on the same line,
\ ** therfor parsing them is trivial

: andc ( f1 f2 -- f3 )
\ *G invert f2 and perform a logical and with f1
    invert and ;

Synonym  |- and ( f1 f2 -- f3 )
\ *G graphical end of input expression synonym for \see{and}

Synonym /|- andc ( f1 f2 -- f3 )
\ *G graphical end of inverted input expression synonym for \see{andc}

Synonym -( dup ( f -- f f )
\ *G graphical start of output synonym

: )- ; ( f -- f )
\ *G graphical end of output synonym (expected one flag to be left on the stack)


\ *S Or-parsing
\ *P Logical ors are on different lines.
\ ** To avoid temporary variables the final outputs are at the bottom line.

: -+ ( f -- f )
\ *G End line and leave flag for consumation by following lines
    line-open @ if
        line-open off
    else
        abort" Line already closed, possible missplaced '-+' or '-||'"
    then ;

Synonym -+- or ( f1 f2 -- f3 )
\ *G graphical join lines synonym

