.global _start

.section .rodata
    msg: .ascii "Hello World!\n"
    msg_len = . - msg

.section .text

_start:
    mov x0, #1
    adrp x1, msg
    add x1, x1, :lo12:msg
    mov x2, #msg_len
    mov x8, #64
    svc #0

    mov x0, xzr
    mov x8, #93
    svc #0

