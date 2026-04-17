.section .rodata
	msg: .ascii "Hello World!\n"
	msg_len = . - msg
	
.section .text
.global _start
	
_start:
	mov x0, #1     // stdout
	adr x1, msg
	mov x2, #msg_len
	mov x8, #64    // write = 64
	svc #0
	
	mov x0, xzr
	mov x8, #93    // exit= 93
	svc #0
