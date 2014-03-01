push 0
push 2
store
push 3


0:
    push 2 add
    call 1
    push 0 load
    add dup
    push 0 swap store
    push 10001 sub jn 0
    onum push 10 ochr exit

1:
    dup dup push 2 sub jz 3
    dup push 2 mod jz 2
    pop push 1 jump 4

2:
    pop push 0 ret

3:
    pop push 1 ret

4:
    push 2 add
    copy 1 copy 1
    dup mul sub jn 3
    copy 1 copy 1 mod jz 2
    jump 4
