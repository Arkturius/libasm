# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgramati <rgramati@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/24 14:17:35 by rgramati          #+#    #+#              #
#    Updated: 2024/06/25 13:41:12 by rgramati         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#source ~/.gef-2024.06.py

# PARAMS ********************************************************************** #

LIBNAME     :=	libasm.a

NAME		:=	libasm_tester

OBJS_DIR	:=	.objs

SRCS_DIR	:=	src

SRCS		:=	ft_strlen.s		\
				ft_strcpy.s		\
				ft_strcmp.s		\
				ft_write.s		\
				ft_read.s		\
				ft_strdup.s		\
				ft_atoi.s		\
				char/ft_isalnum.s	\
				char/ft_isalpha.s	\
				char/ft_iscntrl.s	\
				char/ft_isdigit.s	\
				char/ft_isgraph.s	\
				char/ft_islower.s	\
				char/ft_isprint.s	\
				char/ft_ispunct.s	\
				char/ft_isspace.s	\
				char/ft_isupper.s	\
				char/ft_isxdigit.s	\
				mem/ft_memset.s		\
				mem/ft_bzero.s		\
				mem/ft_memcpy.s		\
				mem/ft_memmove.s	\
				mem/ft_memcmp.s		\
				mem/ft_memchr.s		\
				mem/ft_calloc.s		\
				str/ft_strchr.s		\
				str/ft_strlcat.s	\
				str/ft_strlcpy.s	\
				str/ft_strncmp.s	\
				str/ft_strnstr.s	\
				str/ft_strrchr.s

SRCS		:=	$(addprefix $(SRCS_DIR)/, $(SRCS))

OBJS		:=	$(addprefix $(OBJS_DIR)/, $(SRCS:%.s=%.o))

SRCS_B		:=	bonus/ft_atoi_base.s				\
				bonus/ft_strindex.s					\
				bonus/ft_verif_base.s				\
				bonus/ft_list_pop.s					\
				bonus/ft_sorted_list_insert.s		\
				bonus/ft_sorted_list_insert_elem.s	\
				bonus/ft_list_push_front.s			\
				bonus/ft_list_size.s				\
				bonus/ft_list_remove_if.s			\
				bonus/ft_list_sort.s

SRCS_B		:=	$(addprefix $(SRCS_DIR)/, $(SRCS_B))

OBJS_B		:=	$(addprefix $(OBJS_DIR)/, $(SRCS_B:%.s=%.o))

CC			:=	cc

CFLAGS		:=	-Wall -Wextra -g -lbsd

IFLAGS		:=	-I ./include

NASM		:=	nasm

NASMFLAGS	:=	-f elf64

RM          :=	rm -rf

MAKEFLAGS   +=	--no-print-directory

DIR_DUP     =	mkdir -p $(@D)

# RULES ********************************************************************** #

all: $(LIBNAME)

$(LIBNAME): $(OBJS)
	@ar rc $@ $^
	@printf "$(GREEN)$@ done\n$(RESET)"

bonus: $(OBJS) $(OBJS_B)
	@ar rc $(LIBNAME) $^
	@printf "$(GREEN)$@ done\n$(RESET)"

$(OBJS_DIR)/%.o: %.s
	@$(DIR_DUP)
	@$(NASM) $(NASMFLAGS) $< -o $@

test: all bonus
	@mkdir -p $(OBJS_DIR)/$(SRCS_DIR)/tester
	@$(CC) $(CFLAGS) $(IFLAGS) $(SRCS_DIR)/tester/$(NAME).c $(LIBNAME) -o $(NAME)
	@printf "$(GREEN)$(NAME) done\n$(RESET)"

clean:
	@$(RM) $(OBJS_DIR)
	@$(RM) $(OBJS)
	@printf "$(RED)objs removed\n"

fclean: clean
	@printf "$(RED)$(LIBNAME) removed\n"
	@$(RM) $(LIBNAME)
	@printf "$(RED)$(NAME) removed\n"
	@$(RM) $(NAME)

re:
	@$(MAKE) fclean
	@$(MAKE) all

# COLORS ********************************************************************* #

BLACK		=	\033[30;49;1m
RED			=	\033[31;49;1m
GREEN		=	\033[32;49;1m

RESET		=	\033[0m

LINE_CLR	=	\33[2K\r

# **************************************************************************** #

.PHONY: all clean fclean re
.SILENT: