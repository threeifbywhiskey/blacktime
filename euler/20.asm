push 0
push 100 call 0 jump 2

0:
    dup push 3 sub jn 1
    dup push 1 sub    
    call 0 mul       

1:
    ret

2: 
    swap copy 1 push 10 mod add 
    swap push 10 div dup jz 3
    jump 2

3:
    pop onum
    push 10 ochr exit
