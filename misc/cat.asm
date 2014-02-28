; Copy stdin to stdout. The canonical interpreter can't respond to EOF, but
; Pavel Shub's C++ version treats it as -1. Without this feature, it is not
; possible to copy more than a single line, because 10 must be treated as a
; sentinel value. That's boring, so this cat is implementation-dependent.

0:
    push 0
    dup
    ichr
    load
    dup
    jn 1
    ochr
    jump 0

1:
    pop
    exit
