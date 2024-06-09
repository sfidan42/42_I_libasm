SRC		=	ft_strlen.s \
			ft_strcpy.s \
			ft_strcmp.s \
			ft_write.s \
			ft_read.s \
			#ft_strdup.s
OBJ		=	${SRC:.s=.o}
BSRC	=	ft_atoi_base_bonus.s \
			ft_list_push_front_bonus.s \
			ft_list_size_bonus.s \
			ft_list_sort_bonus.s \
			ft_list_remove_if_bonus.s
BOBJ	=	${OBJ} ${BSRC:.s=.o}
NAME	=	libasm.a
ASM		=	nasm -f elf64
CC		=	gcc -Wall -Wextra -Werror -m64 -g -fPIE
LIB		=	-L. -lasm 

${NAME}: all

%.o: %.s
	${ASM} $< -o $@

compile: all
	${CC} main.c ${LIB} -o run

bcompile: bonus
	${CC} main_bonus.c ${LIB} -o brun

all: ${OBJ}
	ar rcs ${NAME} ${OBJ}

bonus: ${BOBJ}
	ar rcs ${NAME} ${BOBJ}

clean:
	rm -f ./run ./brun
	rm -f ${OBJ} ${BOBJ}

fclean: clean
	rm -f ${NAME}

re: fclean all

.PHONY: all run compile bcompile clean fclean re
