push 0 push 2 store
push 3

0:
    dup push 2000000 swap sub jn 5
    dup call 1 mul
    push 0 load add
    push 0 swap store
    push 2 add jump 0

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

5:
    dup sub load
    onum push 10 ochr exit
