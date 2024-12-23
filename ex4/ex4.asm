; Ask for a number as input and print it - x86_32 version
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
    mov eax, 4               ; System call number for 'write' (int 0x80)
    mov ebx, 1               ; File descriptor: 1 (stdout)
    mov ecx, input_msg       ; Pointer to the input message
    mov edx, len_input_msg   ; Length of the input message
    int 0x80                 ; Trigger system call to write message

    ; Read user input
    mov eax, 3               ; System call number for 'read' (int 0x80)
    mov ebx, 0               ; File descriptor: 0 (stdin)
    mov ecx, value           ; Pointer to buffer for storing input
    mov edx, 5               ; Maximum number of bytes to read
    int 0x80                 ; Trigger system call to read input

    ; Print result message
    mov eax, 4               ; System call number for 'write' (int 0x80)
    mov ebx, 1               ; File descriptor: 1 (stdout)
    mov ecx, display_msg     ; Pointer to the result message
    mov edx, len_display_msg ; Length of the result message
    int 0x80                 ; Trigger system call to write message

    ; Print user input
    mov eax, 4               ; System call number for 'write' (int 0x80)
    mov ebx, 1               ; File descriptor: 1 (stdout)
    mov ecx, value           ; Pointer to the user input buffer
    mov edx, 5               ; Number of bytes to write
    int 0x80                 ; Trigger system call to write input

    ; Exit program
    mov eax, 1               ; System call number for 'exit' (int 0x80)
    mov ebx, 0               ; Exit code: 0 (successful execution)
    int 0x80                 ; Trigger system call to exit

