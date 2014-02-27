; Find the sum of all the multiples of 3 or 5 below 1000.

push 0 ; Initialize the running total
push 1 ; and the current test value.

0:
    dup
    push 999
    sub
    jz 2   ; Done iterating if this is 0.
    push 1
    add    ; Increment otherwise.

    dup
    push 3
    mod
    jz 1   ; Jump to the tallying routine if evenly divisible by 3.

    dup
    push 5
    mod
    jz 1   ; Ditto for 5.

    jump 0 ; Otherwise, try the next value.

1:
    swap   ; Bring the tally to the top
    copy 1 ; and then the current value.
    add    ; The updated tally is on top and the next value beneath it.
    swap   ; Bring it to the top
    jump 0 ; and go again.

2: ; Print final tally and exit.
    pop
    onum
    push 10
    ochr
    exit
