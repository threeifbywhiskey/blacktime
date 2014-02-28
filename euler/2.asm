; This is a much saner approach than my previous attempts. Instead of juggling
; the stack to keep a running total, it simply generates the full sequence and
; then steps back through it to add the even terms to an accumulator. It lives
; on top of the stack, making it significantly easier to work with.

push 0 ; sentinel value
push 1
push 2

0: ; Populate the stack with the Fibonacci sequence.
    copy 1
    copy 1
    add
    dup
    push 4000000
    sub
    jn 0   ; If the current term doesn't exceed 4000000, generate the next one.
    push 0 ; Otherwise, prepare the accumulator and flow into the evens check.

1: ; Pop terms off the stack and handle them accordingly.
    swap   ; Bury the tally one deep and bring the next term to the top.
    dup
    jz 3   ; A zero here is the sentinel value, meaning we're almost done.
    dup
    push 2
    mod
    jz 2   ; Jump if the current term is even.
    pop    ; Otherwise, get rid of it
    jump 1 ; and check the next one.

2: ; This routine only ever sees even numbers.
    add    ; The top two values here are the accumulator and the current term.
    jump 1 ; No need to pop, as the tally is conveniently right on top.

3: ; Print final tally and exit.
    pop ; Get rid of the sentinel.
    onum
    push 10
    ochr
    exit
