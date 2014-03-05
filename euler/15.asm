push 20

dup call 0 
dup mul 

swap push 2 mul call 0
swap div onum

push 10 ochr exit      

0:
    dup push 3 sub jn 1
    dup push 1 sub    
    call 0 mul       

1:
    ret
