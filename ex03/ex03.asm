; List of syscalls: https://filippo.io/linux-syscall-table/

; Macro with 4 arguments
; syscall: write (1), stdout (1), buffer address (msg_result), length (l_msg_result)
%macro scall 4
	mov rax, %1
	mov rdi, %2
	mov rsi, %3
	mov rdx, %4
	syscall
%endmacro

section .data
	msg_input db "Tell me a number: ", 10d, 13d ; 10d: line jump, 13d: carriage return
	l_msg_input equ $-msg_input
	
	msg_finish db "Thanks", 10d ; 10d: line jump, 13d: carriage return
	l_msg_finish equ $-msg_finish
	
section .bss
	input_number resb 20
	
section .text
	global _start
	
_start:
	; Write the prompt message to stdout
	; syscall: write (rax = 1), fd = 1 (stdout), buffer address = msg_input, length = l_msg_input
	scall 1, 1, msg_input, l_msg_input

	; Read user input from stdin into the buffer
	; syscall: read (rax = 0), fd = 0 (stdin), buffer address = input_number, size = 3 (arbitrary, max. number of bytes)
	scall 0, 0, input_number, 3

	; Write the prompt message to stdout
	; syscall: write (rax = 1), fd = 1 (stdout), buffer address = msg_finish, length = l_msg_finish
	scall 1, 1, msg_finish, l_msg_finish

	; Exit the program with return code 0
	; syscall: exit (rax = 60), return code = 0
	scall 60, 0, 0, 0
