; brainfuck interpreter in Whitespace assembly

; To facilitate the interpretation of "literate" brainfuck, consecutive newlines
; are used to signal the end of program input. Thus, the previous character must
; be remembered. Also, non-brainfuck characters must be passed over silenty. The
; heap is used for these processes to avoid having to juggle the stack too much.
push ,
push .
push <
push >
push 45
push 43
push 0
push -7

; Store the brainfuck commands and previous character in negative heap space.
0:
    swap 
    copy 1
    swap 
    store
    push 1
    add 
    dup 
    jn 0

; Initialize the tape at the front of the heap.
1:
    dup
    push 30000
    sub
    jz 2
    dup
    push 0
    store
    push 1
    add
    jump 1

; Read in instructions, storing them at index 30000 on. Bracket pairs are also
; processed here; jumps (in both directions) are stored beginning at 40000. As
; such, programs are limited to 10000 instructions, but that seems sufficient.
2:
    dup
    dup
    ichr
    load
    dup
    push -7
    load     ; Get previous character.
    mul
    push 100 ; Only two consecutive newlines will have a product of 100.
    sub
    jz 9     ; Done reading instructions, begin executing.
    push -7
    copy 1
    store    ; Update previous character.
    dup
    push [
    sub
    jz 7
    dup
    push ]
    sub
    jz 8
    push 10
    sub
    jz 2
    dup
    load
    push -6 ; Character isn't a bracket or newline, flow into validator.

; Test the current character against each brainfuck command.
3: 
    dup
    jz 4   ; All commands tested, no match found.
    dup
    load 
    copy 2
    sub 
    jz 5   ; Found one, return early.
    push 1
    add
    jump 3 ; Try again.

; Character wasn't a command, don't increment the instruction pointer to allow
; the next character to overwrite it.
4:
    pop
    pop
    jump 2

; Valid instruction found, flow into incrementer.
5:
    pop
    pop

; Increment instruction pointer.
6:
    push 1
    add
    jump 2

; Bury the index of the current left bracket under the instruction pointer.
7:
    pop
    dup
    swap
    jump 6

; Match a right bracket with the most recent left and store the indices at the
; corresponding locations in the heap. For instance, the heap for the alphabet
; program (+[.+]) would be {40001: 30004, 40004: 30001}.
8:
    pop
    swap
    copy 1
    copy 1
    push 10000
    add
    swap
    store
    copy 1
    push 10000
    add
    swap
    store
    jump 6

; Prepare the stack for program execution. [instruction pointer, stack pointer]
9:
    dup
    sub
    push 30000
    swap

; Step through the instruction sequence and respond accordingly.
10:
    copy 1
    load
    dup
    push 10
    sub
    jz 18   ; Exit on newline.
    dup
    push 47
    sub
    jn 12   ; Handle IO (.,) and stack adjustment (+-).
    dup
    push >
    swap
    sub
    jn 15   ; Handle loops ([]).
    push 61 ; Otherwise, move the stack pointer (<>).
    sub
    add
    11:     ; Increment the instruction pointer, keep the stack pointer on top.
        swap
        push 1
        add
        swap
        jump 10

; +,-. are ASCII 43-46, so they're all processed here.
12:
    dup
    push 2
    mod
    jz 13   ; If even, do IO.
    push 44 ; Otherwise, inc/decrement the current stack value.
    sub
    copy 1
    load
    swap
    sub
    copy 1
    swap
    push 256
    mod
    store
    jump 11

; IO
13:
    push .
    sub
    jz 14
    dup
    ichr
    jump 11

; Output the current stack value as a character.
14:
    dup
    load
    ochr
    jump 11

; Process loops.
15:
    push [
    sub
    jz 16   ; Jump if left bracket.
    dup
    load    ; Get current stack value.
    jz 11   ; If 0, exit loop.
    jump 17 ; Otherwise, jump to matching left bracket.

; Handle left brackets.
16:
    dup
    load
    jz 17   ; End loop if the current stack value is 0.
    jump 11 ; Otherwise, proceed as usual.

; Jump to just after the matching bracket in either direction.
17:
    swap
    push 10000
    add
    load
    swap
    jump 11

; Exit clean.
18:
    slide 3
    pop
    exit
