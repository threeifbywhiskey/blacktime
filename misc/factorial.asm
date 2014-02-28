push 0 dup inum load    ; Read a number.
call 0 onum             ; Call factorial and print.
push 10 ochr exit       ; Print a newline and exit.

0:
    dup push 3 sub jn 1 ; n = n! for n < 3, so return.
    dup push 1 sub      ; Otherwise, push n-1 onto the stack.
    call 0 mul          ; Call factorial again and multiply.

1:
    ret
