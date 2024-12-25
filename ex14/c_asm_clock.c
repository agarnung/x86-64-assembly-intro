// Calling inline assembly from C and measure execution time
//
// To compile: $ gcc -o c_asm_clock c_asm_clock.c
// 
// To run: $ ./c_asm_clock 500000000000 
// 
// Specifying list of operands in Extended Assembly is optional
//asm ( "assembly code"
//           : output operands                  /* optional */
//           : input operands                   /* optional */
//           : list of clobbered registers      /* optional */
//);

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

/*
 * Use macros to reduce calls
 */
#ifndef ASM_MACROS_H
#define ASM_MACROS_H

// Macro for addition (10 + 20)
#define ADDITION_ASM_CODE   \
    "movq $10, %%rax;"     \
    "movq $20, %%rbx;"     \
    "addq %%rbx, %%rax;"   \
    "movq %%rax, %0;"      \

// Macro for subtraction (10 - 20)
#define SUBTRACTION_ASM_CODE   \
    "movq $10, %%rax;"        \
    "movq $20, %%rbx;"        \
    "subq %%rbx, %%rax;"      \
    "movq %%rax, %0;"         \

// Macro for multiplication (10 * 20)
#define MULTIPLICATION_ASM_CODE  \
    "movq $10, %%rax;"          \
    "movq $20, %%rbx;"          \
    "imulq %%rbx, %%rax;"       \
    "movq %%rax, %0;"           \

#endif // ASM_MACROS_H

int main(int argc, char* argv[])
{
    if (argc < 2) // first argument is executable name
    {
        printf("You have to pass the number of iterations as argument.\n");
        return -1;
    }
    
    long asm_result, c_result;
    clock_t start, end;
    double asm_time, c_time;

    unsigned long long int iterations = strtoull(argv[1], NULL, 10); // convert argument to unsigned long long int
    if (iterations <= 0) 
    {
        printf("Invalid number of iterations. It must be a positive integer.\n");
        return -1;
    }
    
    // Measure Inline Assembly Performance
    start = clock();
    for (int i = 0; i < iterations; i++)
    {
        __asm__ (ADDITION_ASM_CODE : "=r" (asm_result) : : "%rax", "%rbx");
        __asm__ (SUBTRACTION_ASM_CODE : "=r" (asm_result) : : "%rax", "%rbx");
        __asm__ (MULTIPLICATION_ASM_CODE : "=r" (asm_result) : : "%rax", "%rbx");
    }
    end = clock();
    asm_time = ((double)(end - start)) / CLOCKS_PER_SEC;

    // Measure Standard C Arithmetic Performance
    start = clock();
    for (int i = 0; i < iterations; i++) 
    {
        c_result = 10 + 20;
        c_result = 10 - 20;
        c_result = 10 * 20;
    }
    end = clock();
    c_time = ((double)(end - start)) / CLOCKS_PER_SEC;

    printf("Inline Assembly Operations Time for %llu iterations: %.10f seconds\n", iterations, asm_time);
    printf("Standard C Operations Time for %llu iterations: %.10f seconds\n", iterations, c_time);

    return 0;
}



