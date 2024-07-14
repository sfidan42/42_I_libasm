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
BNAME	=	libasm_bonus.a
ASM		=	./nasm/nasm -fmacho64 # -f elf64
CC		=	gcc -Wall -Wextra -Werror

all: ${NAME}

bin/%.o: src/%.s | bin
	${ASM} $< -o $@

bin:
	mkdir bin

${NAME}: ${OBJ}
	ar rcs ${NAME} ${OBJ}
	${CC} -Iinc main.c -L. -lasm -o run

bonus: ${BNAME}

${BNAME}: ${BOBJ}
	ar rcs ${BNAME} ${BOBJ}
	cp ${BNAME} ${NAME}
	${CC} -Iinc main_bonus.c -L. -lasm -o brun

clean:
	rm -f ./run ./brun
	rm -f ${OBJ} ${BOBJ}

fclean: clean
	rm -f ${NAME} ${BNAME}
	rm -rf bin

re: fclean all

.PHONY: all bonus clean fclean re
