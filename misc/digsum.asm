; This program calculates the digital sum of a number provided on stdin.

push 0 ; accumulator
dup
dup
inum
load   ; Grab the number.

0:
    swap
    copy 1
    push 10
    mod
    add     ; Add the mod-10 to the accumulator.
    swap
    push 10
    div     ; Divide the number by 10.
    dup
    jz 1    ; If zero, we're done.
    jump 0  ; Otherwise, go again.

1: ; Print the digital sum and a newline, then exit.
    pop
    onum
    push 10
    ochr
    exit
