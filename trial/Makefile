all:
	@echo "__________________________"
	nasm -f elf64 hello.s
	ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 hello.o -lc -o hello
	@echo "__________________________"
	@echo ./hello:
	@./hello || true

clean:
	rm -f hello hello.o
