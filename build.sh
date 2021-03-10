as src/print.asm -o print.o --64
gcc -static src/main.c print.o -no-pie -m64 -o exec
./exec