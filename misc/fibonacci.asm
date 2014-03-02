push 0 dup inum load
call 0
onum
push 10
ochr
exit

0:
    dup
    push 2
    sub
    jn 1
    dup
    push 1
    sub
    call 0
    swap
    push 2
    sub
    call 0
    add

1:
    ret
