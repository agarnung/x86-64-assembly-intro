// ex12 in C++
//
// To compile: $ g++ -o asm_in_cpp asm_in_cpp.c
// 
// To run: $ ./asm_in_cpp 
//
// extern "C" is necessary when you want to ensure that C functions or assembly
// functions are compatible with the C++ linkage. By the way, here the assembly code
// is inside the main() function and we aren't linking external functions
//extern "C" {
//    void asm_function(); 
//}

#include <iostream>

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

    std::cout << "Enter the first number: ";
    std::cin >> num1;

    std::cout << "Enter the second number: ";
    std::cin >> num2;

    // Inline assembly code to add the two numbers
    __asm__ (
        ADDITION_ASM_CODE        // The macro with assembly code for addition
        : "=r" (asm_result)      // Output operand: result goes to asm_result
        : "r" (num1), "r" (num2) // Input operands: num1 and num2
        : "%rax"                 // Clobbered registers: %rax is modified
    );

    std::cout << "Reslt of addition (with asm): " << asm_result << std::endl;
}



