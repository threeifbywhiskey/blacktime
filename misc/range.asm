; Calling range() will insert between the top two stack values all of the
; intervening consecutive elements: [9, 0, 3, 7] -> [9, 0, 3, 4, 5, 6, 7]

0:
    copy 1
    push 1
    add
    swap
    copy 1
    copy 1
    sub
    jn 0
    pop
    ret
