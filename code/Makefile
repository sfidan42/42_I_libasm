SRC		=	ft_strlen.s \
			ft_strcpy.s \
			ft_strcmp.s \
			ft_write.s \
			ft_read.s \
			ft_strdup.s
		
BSRC	=	${SRC} \
			ft_atoi_base_bonus.s \
			ft_list_push_front_bonus.s \
			ft_list_size_bonus.s \
			ft_list_sort_bonus.s \
			ft_list_remove_if_bonus.s

OBJ		=	$(addprefix bin/, ${SRC:.s=.o})
BOBJ	=	$(addprefix bin/, ${BSRC:.s=.o})
NAME	=	libasm.a
ASM		=	nasm -f elf64 # -f macho64
CC		=	gcc -Wall -Wextra -Werror -m64 -g -Iinc

${NAME}: all

bin/%.o: src/%.s | bin
	${ASM} $< -o $@

bin:
	mkdir bin

all: ${OBJ}
	ar rcs ${NAME} ${OBJ}
	${CC} main.c -L. -lasm -o run -static

bonus: ${BOBJ}
	ar rcs ${NAME} ${BOBJ}
	${CC} main_bonus.c -L. -lasm -o brun -static

clean:
	rm -f ./run ./brun
	rm -f ${OBJ} ${BOBJ}

fclean: clean
	rm -f ${NAME}
	rm -rf bin

re: fclean all

.PHONY: all run compile bcompile clean fclean re
