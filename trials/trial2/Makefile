CC		=	gcc -Wall -Wextra -Werror -m64 -g

all: main

main: hello.o
	ar rcs libhello.a hello.o
	${CC} main.c -L. -lhello -o run -z noexecstack -static

hello.o: hello.s
	nasm -f elf64 -o hello.o hello.s

clean:
	rm -f main.o hello.o run libhello.a
