; Code for sum function, to be linked as an .s from C code
.global add_function
add_function:
    ; Arguments are passed in registers: arg1 = %rdi, arg2 = %rsi
    ; Return value should be in %rax
    addl %esi, %edi      ; Add arg2 (%rsi) to arg1 (%rdi)
    movl %edi, %eax      ; Move result to %eax (return value)
    ret                  ; Return from function

