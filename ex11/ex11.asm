; Creating and writing into a file
; https://www.tutorialspoint.com/assembly_programming/assembly_file_management.htm
; A file descriptor is a 16-bit integer id used for accessing a file strem. 
; For the standard sile streams, the file descriptors are:
; stdin (0), stdout (1), stderr (2)
; A file pointer measures in bytes the location of interest in a (opened) file

section	.data
	file_name db './ex11/created_file.txt', 0
	msg db 'Text written from .asm to file', 10
	len equ  $-msg

section	.text
	global _start ; must be declared for using gcc
   
_start: ; tell linker the entry point
	; Open or create the file (syscall: open, rax=2)
	mov rax, 2              ; Syscall number for open
	lea rdi, [file_name]    ; Pointer to the file name
	mov rsi, 577            ; Flags: O_WRONLY | O_CREAT (0x1 | 0x40 = 577)
	mov rdx, 0777           ; Mode: rwxrwxrwx
	syscall                 ; Call the kernel

	; Store file descriptor in rbx
	mov rbx, rax            ; Save the file descriptor

	; Write to the file (syscall: write, rax=1)
	mov rax, 1              ; Syscall number for write
	mov rdi, rbx            ; File descriptor
	lea rsi, [msg]          ; Pointer to the message
	mov rdx, len            ; Length of the message
	syscall                 ; Call the kernel

	; Close the file (syscall: close, rax=3)
	mov rax, 3              ; Syscall number for close
	mov rdi, rbx            ; File descriptor
	syscall                 ; Call the kernel

	; Exit the program (syscall: exit, rax=60)
	mov rax, 60             ; Syscall number for exit
	xor rdi, rdi            ; Exit code 0
	syscall                 ; Call the kernel

