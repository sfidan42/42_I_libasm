CC		=	gcc -Wall -Wextra -Werror -m64 -g

all: main

main: iter.o
	ar rcs libiter.a iter.o
	${CC} main.c -L. -liter -o run -static

iter.o: iter.s
	nasm -f elf64 -o iter.o iter.s

clean:
	rm -f main.o iter.o run libiter.a
