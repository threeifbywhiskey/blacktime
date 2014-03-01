; Compute the square of the sum using the consecutive sum formula.
push 100
dup
dup
push 2
div    ; Halve it.
swap
push 1
add    ; Grow it.
mul    ; Times it.
dup
mul    ; Square it.
swap

; Prepare the stack and begin the loop that "manually" builds up the sum of the
; squares. Comment these lines out to take the "mathematical" approach instead.
dup
dup
mul
swap
jump 0

; Compute the sum of the squares using the method of finite differences.
; This is significantly more efficient than the loop-based approach, but
; both give the correct answer, so long as only one of them is performed.
dup
push 1
add
copy 1
push 2
mul
push 1
add
mul
mul
push 6
div
jump 1

; Loop from n (100 in the case of the Euler problem) down to 0, pushing the
; square of each value into an accumulator.
0:
    push 1
    sub
    swap
    copy 1
    copy 2
    mul
    add
    swap
    dup
    push 0
    swap
    sub
    jn 0
    pop
    jump 1

1: ; Display the difference and exit.
    sub
    onum
    push 10
    ochr
    exit
