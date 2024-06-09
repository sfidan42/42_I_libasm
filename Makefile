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

all:
	nasm -f macho64 ft_strlen.s -o ft_strlen.o

bonus:

clean:

fclean: clean

re: fclean all

.PHONY: all clean fclean re
