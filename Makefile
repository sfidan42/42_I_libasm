SRC		=	ft_strlen.s \
			ft_strcpy.s \
			ft_strcmp.s \
			ft_write.s \
			ft_read.s \
			ft_strdup.s
OBJ		=	${SRC:.s=.o}
BSRC	=	ft_atoi_base_bonus.s \
			ft_list_push_front_bonus.s \
			ft_list_size_bonus.s \
			ft_list_sort_bonus.s \
			ft_list_remove_if_bonus.s
BOBJ	=	${OBJ} ${BSRC:.s=.o}
NAME	=	libasm.a
COMP	=	nasm

${NAME}: all

%.o: %.s
	${COMP} -f elf64 $< -o $@

all: ${OBJ}
	ar rcs ${NAME} ${OBJ}

bonus: ${BOBJ}
	ar rcs ${NAME} ${BOBJ}

compile: all
	gcc -Wall -Wextra -Werror main.c -m64 -g -L. -lasm -o run

brun: bonus
	gcc -Wall -Wextra -Werror main_bonus.c ${NAME} -o brun
	./brun

clean:
	rm -f ./run ./brun
	rm -f ${OBJ} ${BOBJ}

fclean: clean
	rm -f ${NAME}

re: fclean all

.PHONY: all run brun clean fclean re
