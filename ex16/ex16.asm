; Reading a file and printing its content
; https://www.tutorialspoint.com/assembly_programming/assembly_file_management.htm

section .bss
    fd_in resb 16  ; reserve space for the file descriptor (although probably much less is needed)
    info resb 64   ; reserve space for reading file content

section .data
    file_name db './ex16/file_to_read.txt', 0  ; db == define Byte. End string with NULL
    msg_done db 'File content:', 0x0A          ; message before printing the file content
    len_done equ $-msg_done                    ; length of the message

section .text
    global _start

_start:
    ; Open the file for reading (syscall: open, rax=2)
    mov rax, 2               ; syscall number for open
    lea rdi, [file_name]     ; pointer to the file name (LEA loads the address, MOV loads the value)
    mov rsi, 0               ; flags: O_RDONLY (read-only)
    mov rdx, 0               ; mode (not needed for read-only)
    syscall                  ; call the kernel (open the file)

    ; The open syscall will return a file descriptor in rax
    mov [fd_in], rax        ; store the file descriptor    

    ; Print message "File content:"
    mov rax, 1               ; syscall number for write
    mov rdi, 1               ; file descriptor for stdout
    lea rsi, [msg_done]      ; pointer to the message (LEA loads the address, MOV loads the value)
    mov rdx, len_done        ; length of the message
    syscall                  ; call the kernel

    ; Read from the file (syscall: read, rax=0)
    mov rdx, 64              ; number of bytes to read
    lea rsi, [info]          ; pointer to the buffer to store data (LEA loads the address, MOV loads the value)
    mov rdi, [fd_in]         ; file descriptor
    mov rax, 0               ; syscall number for read
    syscall                  ; call the kernel

    ; Print the read content
    mov rax, 1               ; syscall number for write
    mov rdi, 1               ; file descriptor for stdout
    lea rsi, [info]          ; pointer to the content read (LEA loads the address, MOV loads the value)
    mov rdx, 64              ; number of bytes read
    syscall                  ; call the kernel

    ; Close the file (syscall: close, rax=3)
    mov rax, 3               ; syscall number for close
    mov rdi, [fd_in]         ; file descriptor
    syscall                  ; call the kernel

    ; Exit the program (syscall: exit, rax=60)
    mov rax, 60              ; syscall number for exit
    xor rdi, rdi             ; exit code 0
    syscall                  ; call the kernel

