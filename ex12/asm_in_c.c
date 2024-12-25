// Inline assembly - to use assembly code inside C/C++ code as an inline function
// Assembly language appears in two flavors: Intel Style & AT&T style. 
// GNU C compiler (i.e. GCC) uses AT&T syntaxM this is what we will use
// Another way to use asm from C/C++ would be to compile an .s and declare the prototype
// https://www.codeproject.com/Articles/15971/Using-Inline-Assembly-in-C-Cplusplus
// https://www.reddit.com/r/osdev/comments/xbu135/calling_asm_function_from_c/?rdt=50702
//
// To compile: $ gcc -o asm_in_c asm_in_c.c
// 
// To run: $ ./asm_in_c 
// 
// Specifying list of operands in Extended Assembly is optional
//asm ( "assembly code"
//           : output operands                  /* optional */
//           : input operands                   /* optional */
//           : list of clobbered registers      /* optional */
//);

#include <stdio.h>
#include <stdlib.h>

#ifndef ASM_MACROS_H
#define ASM_MACROS_H

#define ADDITION_ASM_CODE   						      \
    "movq %1, %%rax;"     /* move first input operand to rax register */      \
    "addq %2, %%rax;"     /* add second input operand to rax register */      \
    "movq %%rax, %0;"     /* move result from rax to first output operand */  \

#endif // ASM_MACROS_H

int main(int argc, char* argv[])
{
    long num1, num2, asm_result;

    printf("Enter the first number: ");
    scanf("%ld", &num1);

    printf("Enter the second number: ");
    scanf("%ld", &num2);

    // Inline assembly code to add the two numbers
    __asm__ (
        ADDITION_ASM_CODE        // The macro with assembly code for addition
        : "=r" (asm_result)      // Output operand: result goes to asm_result
        : "r" (num1), "r" (num2) // Input operands: num1 and num2
        : "%rax"                 // Clobbered registers: %rax is modified
    );

    printf("Result of addition (with asm): %ld\n", asm_result);
}



