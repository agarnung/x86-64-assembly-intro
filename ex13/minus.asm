; Subtraction assembly code (64 bits, Intel Style)
; Assemble with $ nasm -f elf64 -o sub.o sub.asm

global sub_function ; global directive to make the function accessible from other files

sub_function:
    ; Arguments are passed in registers: arg1 = %rdi, arg2 = %rsi
    ; Return value should be in %rax
    sub     rdi, rsi      ; Subtract arg2 (%rsi) from arg1 (%rdi)
    mov     rax, rdi      ; Move result to %rax (return value)
    ret

