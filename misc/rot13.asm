0:
    push 0 dup ichr load
    dup jn 4
    call 1 ochr jump 0

1:
    dup push 65 sub jn 2
    dup push 90 sub
    push 0 swap sub jn 2
    push 65 sub
    push 13 add
    push 26 mod
    push 65 add

2:
    dup push 97 sub jn 3
    dup push 122 sub
    push 0 swap sub jn 3
    push 97 sub
    push 13 add
    push 26 mod
    push 97 add

3:
    ret

4:
    pop exit
