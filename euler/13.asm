push 0
dup

0:
    dup push 100 sub jz 1
    swap
    push 0 dup inum load add
    swap push 1 add jump 0

1:
    pop

2:
    push 10 div dup 
    push 1000000000 sub 
    jn 3 jump 2

3:
    push 10 mul onum
    push 10 ochr exit
