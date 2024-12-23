## Overview
This project demonstrates how to use Linux system calls to take user input and display it using assembly language. Examples are provided for both 32-bit (`int 0x80`) and 64-bit (`syscall`) modes.

## Key Concepts

### System Calls
System calls provide an interface between user-space programs and the Linux kernel, allowing tasks such as input/output operations.

- **32-bit Mode (`int 0x80`)**:
  - Uses a software interrupt (`int 0x80`) to invoke system calls.
  - System call numbers are stored in `eax`.
  - Parameters are passed through `ebx`, `ecx`, `edx`, etc.

- **64-bit Mode (`syscall`)**:
  - Uses the `syscall` instruction for more efficient system calls.
  - System call numbers are stored in `rax`.
  - Parameters are passed through `rdi`, `rsi`, `rdx`, `r10`, `r8`, and `r9`.

### Why Use Different Instructions?
- `int 0x80` is legacy and slower due to interrupt overhead.
- `syscall` is faster and optimized for 64-bit processors.
- In 64-bit programs, using `int 0x80` is discouraged.

### Registers Used for System Calls
| Mode     | System Call Number | Parameter Registers        | Instruction |
|----------|---------------------|----------------------------|-------------|
| 32-bit   | `eax`               | `ebx`, `ecx`, `edx`, etc. | `int 0x80`  |
| 64-bit   | `rax`               | `rdi`, `rsi`, `rdx`, etc. | `syscall`   |

---

## How It Works

1. **Prompt User for Input**:
   - Displays a message using the `write` system call.
2. **Read User Input**:
   - Captures input using the `read` system call.
3. **Display the Result**:
   - Outputs a message and the entered value using the `write` system call.

---
