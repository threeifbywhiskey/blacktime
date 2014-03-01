push 5 dup

0:
    copy 1 copy 1 sub jn 1
    push 1000
    copy 1 sub
    copy 2 sub
    copy 2 dup mul
    copy 2 dup mul
    add swap dup mul sub jz 2
    push 5 add jump 0

1:
    pop push 5 add push 5 jump 0

2:
    copy 1 copy 1 add
    push 1000 swap sub mul mul
    onum push 10 ochr exit
