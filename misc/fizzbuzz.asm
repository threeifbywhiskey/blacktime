push 1

0:
    dup dup
    push 3 mod jz 1
    push 5 mod jz 2
    dup onum jump 4

1:
    push F ochr
    push i ochr
    call 3
    push 5 mod jz 2 jump 4

2:
    push B ochr
    push u ochr
    call 3
    jump 4

3:
    push z dup ochr ochr ret

4:
    push 10 ochr
    push 1 add dup
    push 101 sub jn 0
    pop exit
