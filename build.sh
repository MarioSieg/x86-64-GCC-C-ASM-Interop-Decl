as src/asmprocs.asm -o asmprocs.o --64
gcc -static src/main.c asmprocs.o -no-pie -m64 -o exec
./exec