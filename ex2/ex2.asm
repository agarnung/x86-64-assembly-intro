section .data
	num1 dw 5             ; define a word (2 bytes) with value 5
	num2 dw 10            ; define a word (2 bytes) with value 10
	msg db "5 + 10 = ASCII conversion necesary!", 10 ; define an ASCII message with line jump (0x0A = 10)
	len equ $ - msg       ; calculate the length of the message
	
section .bss ; section containing uninitialized data	
	result resb 6  ; space for ASCII result (max. 5 digits + null)

section .text 
	global _start
	
_start:
	;mov rax, [num1] ; value of num1 stored in 64 bits register rax
	;mov ebx, [num2] ; value of num2 stored in 32 bits register rax
	;mov cx, 1  	 ; value 'one' stored in 16 bits register cx
	;mov dl, 1  	 ; value 'one' stored in 8 bits register dl
	
	; Load and add num1 and num2
	mov ax, [num1]        ; load the value of num1 into AX (16 bits)
	add ax, [num2]        ; add the value of num2 to AX

	; Display message
	mov eax, 4            ; syscall: write
	mov ebx, 1            ; file descriptor: stdout
	mov ecx, msg          ; address of the message
	mov edx, len          ; length of the message
	int 0x80              ; perform system call

	; Exit the program
	mov eax, 1            ; syscall: exit
	xor ebx, ebx          ; exit status 0
	int 0x80              ; perform system call
