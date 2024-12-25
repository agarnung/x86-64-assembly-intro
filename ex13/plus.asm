; Addition assembly code (64 bits, Intel Style)
; Assemble with $ nasm -f elf64 -o plus.o plus.asm

global add_function ; global directive to make the function accessible from other files

add_function:
    ; Arguments are passed in registers: arg1 = %rdi, arg2 = %rsi
    ; Return value should be in %rax
    add     rdi, rsi      ; Add arg2 (%rsi) to arg1 (%rdi)
    mov     rax, rdi      ; Move result to %rax (return value)
    ret

