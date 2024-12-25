; Division assembly code (64 bits, Intel Style)
; Assemble with $ nasm -f elf64 -o div.o div.asm

global div_function ; global directive to make the function accessible from other files

div_function:
    ; Arguments are passed in registers: arg1 = %rdi, arg2 = %rsi
    ; Return value should be in %rax (quotient) and %rdx (remainder)
    ; Ensure the divisor is not zero
    test    rsi, rsi        ; Check if divisor is zero
    jz      .div_zero       ; Jump to .div_zero if divisor is zero

    ; Prepare for division (idivq uses %rdi as the dividend and %rsi as the divisor)
    xor     rdx, rdx        ; Clear remainder register (%rdx)
    div     rsi             ; Perform division: result in %rax (quotient), remainder in %rdx

    ; Return the quotient and remainder
    ret

.div_zero:
    mov     rax, 0          ; If divisor is zero, set quotient to 0
    mov     rdx, 0          ; Set remainder to 0
    ret

