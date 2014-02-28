push 0
push 6857
push 1471
mul
store
push 3

0:
    dup
    dup
    mul
    push 0
    load
    swap
    copy 1
    swap
    sub
    jn 2
    copy 1
    copy 1
    copy 1
    div
    copy 1
    mul
    slide 1
    swap
    copy 1
    sub
    jz 1
    pop
    push 2
    add
    jump 0

1:
    copy 1
    div
    push 0
    swap
    store
    push 2
    add
    jump 0

2:
    onum
    pop
    push 10
    ochr
    exit
