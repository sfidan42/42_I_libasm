CC		=	gcc -Wall -Wextra -Werror -m64 -g

all: main

main: utils.o
	ar rcs libutils.a utils.o
	${CC} main.c -L. -lutils -o run -static

utils.o: utils.s
	nasm -f elf64 -o utils.o utils.s

clean:
	rm -f main.o utils.o run libutils.a
