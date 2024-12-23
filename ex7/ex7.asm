; Converts two ASCII digits to binary (numeric) and prints binary (numeric) sum result
; The conversion is equivalent to substract/add the offset, i.e. the ASCII value of '0'

section .data
    msg db "Sum of 3 and 4 is: " ; Message to be displayed before the sum
    len equ $ - msg              ; Length of the message string
    newline db 10                ; Newline character (ASCII value 0xA)

section .bss
    sum resb 1                    ; Reserve 1 byte for the sum result (ASCII value)

section .text
    global _start

_start:
    ; Convert '3' from ASCII to binary
    mov rax, '3'               ; Load the ASCII value of '3' (51) into rax
    sub rax, '0'               ; Subtract the ASCII value of '0' (48) to get the number 3

    ; Convert '4' from ASCII to binary
    mov rbx, '4'               ; Load the ASCII value of '4' (52) into rbx
    sub rbx, '0'               ; Subtract the ASCII value of '0' (48) to get the number 4

    ; Perform the sum of 3 and 4
    add rax, rbx               ; Add the values of rax and rbx (3 + 4 = 7)

    ; Convert the sum result (7) back to ASCII
    add rax, '0'               ; Convert the result (7) back to ASCII by adding the value of '0' (48)

    mov [sum], al              ; Store the ASCII character (7) in the 'sum' variable

    ; Print the message: "Sum of 3 and 4 is: "
    mov rdi, 1                 ; File descriptor 1 (stdout)
    mov rsi, msg               ; Pointer to the message
    mov rdx, len               ; Length of the message
    mov rax, 0x1               ; System call number for 'write' (syscall)
    syscall                    ; Call the kernel to write the message

    ; Print the sum result (which is the ASCII value of '7')
    mov rdi, 1                 ; File descriptor 1 (stdout)
    mov rsi, sum               ; Pointer to the sum variable
    mov rdx, 1                 ; Number of bytes to write (just 1 byte)
    mov rax, 0x1               ; System call number for 'write' (syscall)
    syscall                    ; Call the kernel to write the sum

    ; Print newline
    mov rdi, 1                 ; File descriptor 1 (stdout)
    mov rsi, newline           ; Pointer to the newline character
    mov rdx, 1                 ; Number of bytes to write (just 1 byte)
    mov rax, 0x1               ; System call number for 'write' (syscall)
    syscall                    ; Call the kernel to write the newline

    ; Exit the program
    mov rax, 60                ; System call number for 'exit' (syscall)
    xor rdi, rdi               ; Return code 0 (successful exit)
    syscall                    ; Exit the program

