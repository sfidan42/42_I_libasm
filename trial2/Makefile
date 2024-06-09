all: main

main: hello.o
	gcc -no-pie -o main main.c hello.o

hello.o: hello.s
	nasm -f elf64 -o hello.o hello.s

clean:
	rm -f main.o hello.o main
