push 0
dup
store
push 900
dup

0:
    copy 1 push 999 sub jz 10
    push 1 add call 1
    dup push 999 sub jz 2
    jump 0

1:
    copy 1 copy 1 mul dup call 7
    copy 1 sub jz 3 pop ret

2:
    pop push 1 add push 900
    jump 0

3:
    push 0 load call 4
    push 0 swap store
    jump 0

4:
    copy 1 copy 1 sub jn 6

5:
    pop ret

6:
    swap jump 5

7:
    push 0

8:
    push 10 mul
    copy 1 push 10 mod add swap
    push 10 div dup jz 9 swap
    jump 8

9:
    pop ret

10:
    pop dup sub load onum
    push 10 ochr exit
