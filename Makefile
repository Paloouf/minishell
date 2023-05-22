# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ltressen <ltressen@student.42perpignan.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/16 14:22:58 by ltressen          #+#    #+#              #
#    Updated: 2023/05/22 15:51:44 by ltressen         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FLAGS = -Wall -Werror -Wextra

NAME = minishell.a

EXEC= minishell

SRC = minishell.c
	
OBJ = ${SRC:.c=.o} 
	
all: $(NAME)

$(NAME): ${OBJ}
	make -C libft/
	mv libft/libft.a ${NAME}
	gcc -c ${FLAGS} ${SRC}
	ar rc ${NAME} ${OBJ}
	gcc ${FLAGS} -g ${SRC} ${NAME} -o ${EXEC}
	
clean:
	make clean -C libft/
	rm -f ${OBJ}

fclean:
	make clean -C libft/
	rm -f ${OBJ}
	rm -f ${NAME} ${EXEC}

re: fclean all
