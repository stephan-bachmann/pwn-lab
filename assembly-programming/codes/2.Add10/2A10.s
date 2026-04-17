.section .text
.global _start

_start:
mov x0, #0     // result
mov x1, #1     // n

sum_start:
add x0, x0, x1 // result += n
add x1, x1, #1 // n++
cmp x1, #10    // if n <= 10
b.le sum_start //   jmp sum_start

sum_end:
mov x8, #93
svc #0
