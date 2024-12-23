; Read two numbers in ASCII, sum them in binary and print the result in ASCII

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
globa	l _start

_start:
	; Prompt user for the first number
	mov rax, 1                                ; System call number for 'write' (syscall)
	mov rdi, 1                                ; File descriptor: 1 (stdout)
	mov rsi, input1_msg                       ; Pointer to the input message
	mov rdx, len_input1_msg                   ; Length of the input message
	syscall                                   ; Trigger system call to write message

	; Read the first number from user input
	mov rax, 0                                ; System call number for 'read' (syscall)
	mov rdi, 0                                ; File descriptor: 0 (stdin)
	mov rsi, input1                           ; Pointer to buffer for storing input
	mov rdx, 2                                ; Maximum number of bytes to read (2 bytes for the number)
	syscall                                   ; Trigger system call to read input

	; Prompt user for the second number
	mov rax, 1                                ; System call number for 'write' (syscall)
	mov rdi, 1                                ; File descriptor: 1 (stdout)
	mov rsi, input2_msg                       ; Pointer to the input message
	mov rdx, len_input2_msg                   ; Length of the input message
	syscall                                   ; Trigger system call to write message

	; Read the second number from user input
	mov rax, 0                                ; System call number for 'read' (syscall)
	mov rdi, 0                                ; File descriptor: 0 (stdin)
	mov rsi, input2                           ; Pointer to buffer for storing input
	mov rdx, 2                                ; Maximum number of bytes to read (2 bytes for the number)
	syscall                                   ; Trigger system call to read input

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
	mov rax, 1                                ; System call number for 'write' (syscall)
	mov rdi, 1                                ; File descriptor: 1 (stdout)
	mov rsi, sum_msg                          ; Pointer to the sum message
	mov rdx, len_sum_msg                      ; Length of the sum message
	syscall                                   ; Trigger system call to write message

	; Print the sum result (the ASCII character of the sum)
	mov rax, 1                                ; System call number for 'write' (syscall)
	mov rdi, 1                                ; File descriptor: 1 (stdout)
	mov rsi, sum                              ; Pointer to the sum variable
	mov rdx, 1                                ; Number of bytes to write (1 byte for the sum)
	syscall                                   ; Trigger system call to write the sum

	; Print newline character
	mov rax, 1                                ; System call number for 'write' (syscall)
	mov rdi, 1                                ; File descriptor: 1 (stdout)
	mov rsi, newline                          ; Pointer to the newline character
	mov rdx, 1                                ; Number of bytes to write (1 byte for newline)
	syscall                                   ; Trigger system call to write newline

	; Exit the program
	mov rax, 60                               ; System call number for 'exit' (syscall)
	xor rdi, rdi                              ; Return code 0 (successful exit)
	syscall                                   ; Trigger system call to exit

