all: main

main: main.o hello.o
	gcc -no-pie -o main main.o hello.o

main.o: main.c
	gcc -c main.c

hello.o: hello.s
	nasm -f elf64 -o hello.o hello.s

clean:
	rm -f main.o hello.o main
