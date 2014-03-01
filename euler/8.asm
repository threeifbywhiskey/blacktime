push -1
push 0

0:
    dup
    push 1000
    sub
    jz 2
    push 0
    dup
    ichr
    load
    dup
    push 10
    sub
    jz 1
    push 48
    sub
    swap
    push 1
    add
    jump 0

1:
    pop
    jump 0

2:
    copy 1
    copy 3
    copy 5
    copy 7
    copy 9
    mul
    mul
    mul
    mul
    call 3
    copy 5
    push 1
    add
    jz 6
    slide 1
    jump 2

3:
    copy 1
    copy 1
    sub
    jn 5
    jump 4

4:
    pop
    ret

5:
    swap
    jump 4

6:
    slide 5
    onum
    push 10
    ochr
    exit
