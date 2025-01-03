; Load two numbers from input and print them with a separator. Problem: line jump added by syscall

section .data
    input1_msg db 'Enter first number: '      ; Message asking for the first number
    len_input1_msg equ $ - input1_msg         ; Length of the first input message

    input2_msg db 'Enter second number: '     ; Message asking for the second number
    len_input2_msg equ $ - input2_msg         ; Length of the second input message

    hyphen db '-'                             ; The hyphen to separate the numbers
    len_hyphen equ $ - hyphen                 ; Length of the hyphen

section .bss
    input1 resb 8                             ; Reserve 8 bytes for the first number input
    input2 resb 8                             ; Reserve 8 bytes for the second number input

section .text
    global _start

_start:
    ; Prompt user for the first number
    mov rax, 1                 ; System call number for 'write' (syscall)
    mov rdi, 1                 ; File descriptor: 1 (stdout)
    mov rsi, input1_msg        ; Pointer to the input message
    mov rdx, len_input1_msg    ; Length of the input message
    syscall                    ; Trigger system call to write message

    ; Read the first number from user input
    mov rax, 0                 ; System call number for 'read' (syscall)
    mov rdi, 0                 ; File descriptor: 0 (stdin)
    mov rsi, input1            ; Pointer to buffer for storing input
    mov rdx, 8                 ; Maximum number of bytes to read (8 bytes for safety)
    syscall                    ; Trigger system call to read input

    ; Prompt user for the second number
    mov rax, 1                 ; System call number for 'write' (syscall)
    mov rdi, 1                 ; File descriptor: 1 (stdout)
    mov rsi, input2_msg        ; Pointer to the input message
    mov rdx, len_input2_msg    ; Length of the input message
    syscall                    ; Trigger system call to write message

    ; Read the second number from user input
    mov rax, 0                 ; System call number for 'read' (syscall)
    mov rdi, 0                 ; File descriptor: 0 (stdin)
    mov rsi, input2            ; Pointer to buffer for storing input
    mov rdx, 8                 ; Maximum number of bytes to read (8 bytes for safety)
    syscall                    ; Trigger system call to read input

    ; Print the first number
    mov rax, 1                 ; System call number for 'write' (syscall)
    mov rdi, 1                 ; File descriptor: 1 (stdout)
    mov rsi, input1            ; Pointer to the first input buffer
    mov rdx, 8                 ; Number of bytes to write (up to 8 characters)
    syscall                    ; Trigger system call to write first number

    ; Print the hyphen separator
    mov rax, 1                 ; System call number for 'write' (syscall)
    mov rdi, 1                 ; File descriptor: 1 (stdout)
    mov rsi, hyphen            ; Pointer to the hyphen character
    mov rdx, len_hyphen        ; Length of the hyphen (1 byte)
    syscall                    ; Trigger system call to write the hyphen

    ; Print the second number
    mov rax, 1                 ; System call number for 'write' (syscall)
    mov rdi, 1                 ; File descriptor: 1 (stdout)
    mov rsi, input2            ; Pointer to the second input buffer
    mov rdx, 8                 ; Number of bytes to write (up to 8 characters)
    syscall                    ; Trigger system call to write second number

    ; Exit program
    mov rax, 60                ; System call number for 'exit' (syscall)
    mov rdi, 0                 ; Exit code: 0 (successful execution)
    syscall                    ; Trigger system call to exit

