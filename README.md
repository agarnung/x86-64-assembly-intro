# x86-64-assembly-intro
Introductory exercises to assembly language.

> [!IMPORTANT]
> Be sure your machine uses a x86_64 processor: ```uname -a```

## About

The exercies are biased towards the x86-based processors supporting _protected_ mode, rather than the more insecure _active_ mode. The code is run on a 64-bit Linux machine with a 12th Gen Intel(R) Core(TM) i7-12650H CPU.

Assembly language appears in two flavors: Intel Style & AT&T style. GNU C compiler (i.e. GCC) uses AT&T. But the exercises will be in Intel style (e.g. NASM). There are several syntax differences, see [this](https://www.codeproject.com/Articles/15971/Using-Inline-Assembly-in-C-Cplusplus) and [that](https://imada.sdu.dk/u/kslarsen/dm546/Material/IntelnATT.htm).

The open source NASM assembler is used to run the scripts:
```<sh>
sudo apt-get install nasm
```

How to compile, link and run a .asm code? Execute the provided shell script with the target folder's name as input argument, e.g.:  
```<sh>
chmod 755 my-run_asm.sh && ./run_asm.sh ./ex1
```

These exercises are (and will be) based on the listed references.

## Index
- [ex01](https://github.com/agarnung/x86-64-assembly-intro/tree/main/ex01): ...
- [ex02](https://github.com/agarnung/x86-64-assembly-intro/tree/main/ex02): ...
- ...
  
## References:

1. Books
  - https://pacman128.github.io/static/pcasm-book.pdf (Paul A. Carter, 2019)
  - https://jagdishkapadnis.wordpress.com/wp-content/uploads/2015/05/assembly-language-step-by-step-programming-with-linux-3rd-edition.pdf (Jeff Duntemann, 2009)
2. Links
  - https://en.wikipedia.org/wiki/Assembly_language#%22Hello,_world!%22_on_x86_Linux
  - https://p403n1x87.github.io/getting-started-with-x86-64-assembly-on-linux.html
  - https://cratecode.com/info/nasm-tutorial
  - https://www.tutorialspoint.com/assembly_programming/index.htm
  - https://asmtutor.com/
  - https://stackoverflow.com/questions/2352048/to-learn-assembly-should-i-start-with-32-bit-or-64-bit
3. Videos
  - https://www.youtube.com/watch?v=VQAKkuLL31g&list=PLetF-YjXm-sCH6FrTz4AQhfH6INDQvQSn (series by @kupala)
4. Repos
  - https://github.com/code-tutorials/assembly-intro
  - https://github.com/luamfb/intro_x86-64
  - https://github.com/7h3w4lk3r/x86-nasm
5. Other
  - https://www.cs.virginia.edu/~jh2jf/courses/cs2130/spring2023/lectures/21-assembly.pdf
  - List of syscalls: https://filippo.io/linux-syscall-table/
