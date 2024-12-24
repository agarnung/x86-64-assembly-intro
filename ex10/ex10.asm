; Use of macros to print messages with write system call

; 32 bits version
;%macro write_string 2 
;	mov   eax, 4   
;	mov   ebx, 1   
;	mov   ecx, %1  
;	mov   edx, %2  
;	int   80h
;%endmacro

; 64 bits version
%macro write_string 2 ; 2 parameters
	mov rax, 1    ; syscall: write
	mov rdi, 1    ; file descriptor: stdout
	mov rsi, %1   ; address of the message
	mov rdx, %2   ; length of the message
	syscall	      ; call kernel	
%endmacro

section	.data
	msg1 db	'This message ha a line jump and a carriage return', 0xA, 0xD 	
	len1 equ $-msg1			

	msg2 db 'This message is totally alone'
	len2 equ $-msg2 

	msg3 db '...I am a carriage return =>', 10
	len3 equ $-msg3

section .text
	global _start
	
_start:
	write_string msg1, len1               
	write_string msg2, len2    
	write_string msg3, len3  

	mov rax, 60  ; sys_exit
	xor rdi, rdi ; exit code: 0 (faster than mov rdi, 0)
	syscall               
