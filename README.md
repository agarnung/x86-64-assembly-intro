# x86-64-assembly-intro
Introductory exercises to assembly language.

> [!IMPORTANT]
> Be sure your machine uses a x86_64 processor: $ ```uname -a```

The exercies are biased towards the 80386-based processors supporting _protected_ mode, rather than classic 8086-based processors supporting the more insecure _active_ mode. 

The open source NASM assembler is used to run the scripts: $ 
```<sh>
sudo apt-get install nasm
```

How to compile and link a .asm code?:  
```<sh>
nasm -f elf64 -o code.o code.asm
ld code.o -o code
```

These exercises are (and will be) based on the listed references.

**References**:

1. Books
  - https://pacman128.github.io/static/pcasm-book.pdf (Paul A. Carter, 2019)
2. Links
  - https://en.wikipedia.org/wiki/Assembly_language#%22Hello,_world!%22_on_x86_Linux
  - https://github.com/code-tutorials/assembly-intro
  - https://p403n1x87.github.io/getting-started-with-x86-64-assembly-on-linux.html
3. Videos
  - https://www.youtube.com/watch?v=VQAKkuLL31g&list=PLetF-YjXm-sCH6FrTz4AQhfH6INDQvQSn (series by @kupala)
