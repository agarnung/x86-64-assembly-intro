// Use in C a function defined externally in assembly
// External .asm functions can be compiled in Intel format with NASM
// To compile the code into an object file: $ gcc -c -o main.o main.c
// To compile the code into an object file and link all object together: 
// 	$ gcc -o main plus.o minus.o by.o times.o main.o
// To run the program: $ ./main

#include <stdio.h>

// One must declare the function prototype as if it were a c function
extern int add_function(int, int);
extern int sub_function(int, int);
extern int mul_function(int, int);
extern void div_function(int, int, int*, int*);  // for quotient and remainder

int main()
{
    int arg1, arg2, add, sub, mul, quo, rem;

    printf("Enter first integer number: \n\t");
    scanf("%d", &arg1);
    
    printf("Enter second integer number: \n\t");
    scanf("%d", &arg2);
    
    add = add_function(arg1, arg2);
    sub = sub_function(arg1, arg2);
    mul = mul_function(arg1, arg2);
    div_function(arg1, arg2, &quo, &rem); 

    printf("%d + %d = %d\n", arg1, arg2, add);
    printf("%d - %d = %d\n", arg1, arg2, sub);
    printf("%d * %d = %d\n", arg1, arg2, mul);
    printf("%d / %d = %d\n", arg1, arg2, quo);
    printf("%d %% %d = %d\n", arg1, arg2, rem);

    return 0;
}



