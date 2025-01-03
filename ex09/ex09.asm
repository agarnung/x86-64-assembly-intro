; ex8 with a macro

; The rax, rdi, rsi and rdx are used by the syscall function call
; The registers are saved on the stack and then their original value is restored from there (LIFO)
%macro scall 4
	mov rax, %1
	mov rdi, %2
	mov rsi, %3
	mov rdx, %4
	syscall
%endmacro

section .data
	input1_msg db 'Enter first number: '      ; Message asking for the first number
	len_input1_msg equ $ - input1_msg         ; Length of the first input message

	input2_msg db 'Enter second number: '     ; Message asking for the second number
	len_input2_msg equ $ - input2_msg         ; Length of the second input message

	sum_msg db 'Sum is: '                     ; Message for displaying the sum
	len_sum_msg equ $ - sum_msg               ; Length of the sum message

	newline db 10                             ; Newline character (ASCII value 0xA)

section .bss
	input1 resb 2                             ; Reserve 2 bytes for the first number input (to store ASCII digits)
	input2 resb 2                             ; Reserve 2 bytes for the second number input
	sum resb 1                                ; Reserve 1 byte for storing the sum result

section .text
	global _start

_start:
	; Prompt user for the first number
	scall 1, 1, input1_msg, len_input1_msg
	
	; Read the first number from user input
	scall 0, 0, input1, 2
	
	; Prompt user for the second number
	scall 1, 1, input2_msg, len_input2_msg
	
	; Read the second number from user input
	scall 0, 0, input2, 2
	
	; Convert the first input (ASCII digits) to integers
	mov al, byte [input1]                     ; Load the first digit (ASCII) of input1 into AL (8 bits; ASCII fits)
	sub al, '0'                               ; Convert ASCII to integer by subtracting ASCII value of '0'

	mov bl, al                                ; Store the first integer in BL (lower 8 bits of RBX)

	; Convert the second input (ASCII digits) to integers
	mov al, byte [input2]                     ; Load the first digit (ASCII) of input2 into AL (8 bits; ASCII fits)
	sub al, '0'                               ; Convert ASCII to integer by subtracting ASCII value of '0'

	add bl, al                                ; Add the two integers (BL = BL + AL)

	; Convert the sum back to ASCII
	add bl, '0'                               ; Convert the sum (integer) back to ASCII by adding '0'

	mov [sum], bl                             ; Store the ASCII sum in the 'sum' variable

	; Print the sum message "Sum is: "
	scall 1, 1, sum_msg, len_sum_msg
	
	; Print the sum result (the ASCII character of the sum)
	scall 1, 1, sum, 2
	
	; Print newline character
	scall 1, 1, newline, 1
	
	; Exit the program
	scall 60, 0, 0, 0
	
