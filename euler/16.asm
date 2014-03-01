push 0 dup store
push 1 push 2 store 
push 2 push -1 store 

push 1 push 0 

0:
    copy 1 load
    dup push 1 add jz 1
    dup add add
    dup push 10 mod
    copy 2 swap store
    push 10 div swap
    push 1 add swap jump 0

1:
    push 0 dup load
    push 1 add dup
    push 999 sub jz 4
    store pop push 1 sub jz 3

2:
    push -1 store
    push 1 push 0 jump 0

3:
    dup push 1 store
    push 1 add jump 2

4:
    pop pop pop swap
    push 1 sub swap

5: 
    copy 1 load add 
    swap push 1 sub dup
    jz 6 swap jump 5

6:
    pop
    onum push 10 ochr exit
