push 0 dup inum load      ; Read and load a number.

0:
    dup onum push 32 ochr ; Print the number and a space.
    dup push 1 sub jz 2   ; Exit when the number is 1.
    dup push 2 mod jz 1   ; Jump to handle even.
    push 3 mul push 1 add ; 3n + 1 if odd
    jump 0 

1:
    push 2 div jump 0     ; Divide by 2 and go again.

2:
    pop
    push 10 ochr exit     ; Print a newline and exit.
