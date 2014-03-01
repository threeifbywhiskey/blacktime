; As there is no string mechanism, names must be encoded some other way if they
; are to be sorted. Here, they're converted to something akin to base-27, where
; A = 1, etc., then padded to 11 digits to prevent ZELDA preceding ALEJANDRINA.

; Prepare the first 11 powers of 27 in negative heap space. {-1: 1, -2: 27}
push -1
push 1
store
push -1

0:
    dup
    load
    push 27
    mul
    swap
    push 1
    sub
    swap
    copy 1
    swap
    store
    dup
    push 11
    add
    push 0
    swap
    sub
    jn 0    ; If i + 11 is still negative, go again.
            ; Otherwise, prepare the stack for tallying and flow into reader.
    push 1  ; name index
    swap    ; -11, the initial power of 27 to retrieve
    push 0  ; cumulative name total

; Read in names, storing their encoded values in the heap at index 1 onward.
1:
    push 0
    dup
    ichr
    load    ; Get next character onto the stack.
    push "
    sub
    jz 1    ; Eat quotes early.
    push 0
    load    ; Reload character.
    dup
    push ,
    sub
    jz 2    ; Done reading current name.
    push 10
    sub
    jz 3    ; Done reading on newline.
    push 0
    load    ; Reload again to keep the stack clean.
    push 64
    sub     ; Get alphabetic value.
    copy 2
    load    ; Get current power of 27.
    mul
    add     ; Add the product to the cumulative name total.
    swap
    push 1
    add     ; Increment power index.
    swap
    jump 1  ; Keep the stack in order and go again.

2:
    pop      ; Discard the character.
    slide 1  ; And the power index.
    copy 1
    swap
    store    ; Put the name value in the heap.
    push 1
    add      ; Increment name index.
    push -11 ; Reset power of 27
    push 0   ; and name total.
    jump 1

; Store the final name, because it didn't get triggered by a comma.
3:
    slide 1 ; Discard power index reached.
    copy 1
    swap
    store
    push 1
    add
    dup
    push 2
    div
    push -1
    swap
    store

; This is an embarrassing implementation of Shell sort that uses the heap for
; pretty much everything. I tried to wrestle Whitespace into juggling four
; stack variables while still being able to clean up at the end but it just
; doesnt't seem feasible. I've minimized the disgust for your safety.
4: push -1 load dup jz 10 push -2 swap store
5: push -2 load copy 1 copy 1 sub push 1 sub jn 8 push -1 load sub push -3 swap store
6: push -3 load dup dup jn 7 push -1 load add copy 1 copy 1 load swap load
   sub push 0 swap sub jn 7 call 9 copy 1 sub sub push -3 swap store jump 6
7: pop pop push -2 dup load push 1 add store jump 5
8: pop push -1 dup load push 2 div store jump 4

; This swap routine is pretty nifty, though.
9:
    copy 1
    copy 1
    load
    swap
    load
    copy 2
    swap
    store
    copy 2
    swap
    store
    ret

10: ; 5164 0
    swap    ; 0 5164
    push 1
    sub     ; 0 5163
    dup
    jz 12    ; 0 5163
    swap    ; 5163 0
    copy 1    ; 5163 0 5163
    load    ; 5163 0 NAME

11: ; 5163 0 NAME
    swap    ; 5163 NAME 0
    copy 1  ; 5163 NAME 0 NAME
    push 27
    mod     ; 5163 NAME 0 NAME%27
    add     ; 5163 NAME NEWV
    swap    ; 5163 NEWV NAME
    push 27
    div     ; 5163 NEWV NAME/27
    dup
    push 0  ; 5163 NEWV N27 N27 0
    swap    ; 5163 NEWV N27 0 N27
    sub     ; 5163 NEWV N27 0-N27
    jn 11 ; 5163 NEWV N27
    pop
    copy 1 ; 5163 NEWV 5163
    mul     ; 5163 NP
    push -1
    load    ; 5163 NP tally
    add
    push -1
    swap
    store
    push 0
    jump 10

12: ; 0 5163
    push -1
    slide 2
    load
    onum
    push 10
    ochr
    exit
