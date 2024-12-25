; Multiplication assembly code (64 bits, Intel Style)
; Assemble with: $ nasm -f elf64 -o times.o times.asm

section .text
	global mul_function

; Arguments are passed in registers: 
; arg1 = %rdi, arg2 = %rsi
; Return value should be in %rax

mul_function:            ; Function label (with colon)
	imul    rdi, rsi     ; Multiply arg1 (rdi) by arg2 (rsi)
	mov     rax, rdi     ; Move result to rax (return value)
	ret                  ; Return from function

