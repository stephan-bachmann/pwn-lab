.section .data
buffer:
	.space 2
.section .text
.global _start

_start:
	mov x0, #5        // n = 5
	add x0, x0, #'0'  // n += '0' -> '5'
	
	adr x1, buffer
	strb w0, [x1]     // buffer[0] = '5'
	
	mov x2, #0xa
	strb w2, [x1, #1] // buffer[1] = '\n'
	
	mov x0, #1  // fd = stdout
              // x1 = buffer
  mov x2, #2  // size = 2
	mov x8, #64 // syscall = write
	svc #0
	
	
	mov x0, xzr // exit code = 0
	mov x8, #93 // syscall = exit
	svc #0
