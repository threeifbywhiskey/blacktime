push 2520
push 11

0:
    copy 1 copy 1
    dup push 20 sub jz 2
    mod push 0 swap sub jn 1
    push 1 add
    jump 0

1:
    pop push 2520 add push 11
    jump 0

2:
    swap slide 3 onum
    push 10 ochr exit
