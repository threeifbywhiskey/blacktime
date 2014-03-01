push 0

0:
    dup inum push 1 add
    dup push 400 sub jn 0
    dup push 0 store

1:
    push 1 sub dup
    push 60 sub jz 5
    dup push 19 sub load
    copy 1 push 38 sub load
    copy 2 push 57 sub load
    copy 3 load
    mul mul mul
    push 400 swap copy 1 load
    call 2 store jump 1

2:
    copy 1 copy 1 sub jn 4

3:
    pop ret

4:
    swap jump 3

5:
    pop push 400 load
    onum push 10 ochr exit
