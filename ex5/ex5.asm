; Ask for a number as input and print it - x86_64 version
; see:
; 	https://stackoverflow.com/questions/10583891/is-syscall-an-instruction-on-x86-64
;	https://www.linuxquestions.org/questions/programming-9/linux-assembler-tutorial-int-0x80-vs-syscall-4175579155/
;	https://stackoverflow.com/questions/12806584/what-is-better-int-0x80-or-syscall-in-32-bit-code-on-linux

section .data
    input_msg db 'Enter a number: ', 0x0A  ; Message to prompt user input, 0x0A is jump
    len_input_msg equ $ - input_msg       ; Length of the input message

    display_msg db 'You entered the value: ', 0x0A ; Message to display the result, 0x0A is jump
    len_display_msg equ $ - display_msg   ; Length of the result message

section .bss
    value resb 5  ; Buffer to store the user input (up to 5 bytes)

section .text
global _start

_start:
    ; Prompt user for input
    mov rax, 1               ; System call number for 'write' (syscall)
    mov rdi, 1               ; File descriptor: 1 (stdout)
    mov rsi, input_msg       ; Pointer to the input message
    mov rdx, len_input_msg   ; Length of the input message
    syscall                  ; Trigger system call to write message

    ; Read user input
    mov rax, 0               ; System call number for 'read' (syscall)
    mov rdi, 0               ; File descriptor: 0 (stdin)
    mov rsi, value           ; Pointer to buffer for storing input
    mov rdx, 5               ; Maximum number of bytes to read
    syscall                  ; Trigger system call to read input

    ; Print result message
    mov rax, 1               ; System call number for 'write' (syscall)
    mov rdi, 1               ; File descriptor: 1 (stdout)
    mov rsi, display_msg     ; Pointer to the result message
    mov rdx, len_display_msg ; Length of the result message
    syscall                  ; Trigger system call to write message

    ; Print user input
    mov rax, 1               ; System call number for 'write' (syscall)
    mov rdi, 1               ; File descriptor: 1 (stdout)
    mov rsi, value           ; Pointer to the user input buffer
    mov rdx, 5               ; Number of bytes to write
    syscall                  ; Trigger system call to write input

    ; Exit program
    mov rax, 60              ; System call number for 'exit' (syscall)
    mov rdi, 0               ; Exit code: 0 (successful execution)
    syscall                  ; Trigger system call to exit

