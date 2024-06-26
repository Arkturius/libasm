/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rgramati <rgramati@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/06/04 18:29:11 by rgramati          #+#    #+#             */
/*   Updated: 2024/06/22 21:13:50 by rgramati         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef __LIBASM_H
# define __LIBASM_H

# include <stdlib.h>

# include <char.h>

typedef struct  s_list
{
	void			*data;
	struct s_list	*next;
}   t_list;

/* MANDATORY **************************************************************** */

size_t  ft_strlen(
    const char *str
    );

char    *ft_strcpy(
    char *dst,
    const char *src
    );

int		ft_strcmp(
    const char *s1,
    const char *s2);

ssize_t	ft_read(
    int fd,
    void *buf,
    size_t count
    );

ssize_t	ft_write(
    int fd,
    const void *buf,
    size_t count
    );

char	*ft_strdup(
    const char *s
    );

/* BONUS ******************************************************************** */

int ft_atoi(
    const char *str
    );

int ft_strindex(
    const char *str,
    char c
    );

int ft_verif_base(
    const char *base
    );

int ft_atoi_base(
    const char *str,
    const char *base
    );

void    ft_list_push_front(
    t_list **lst,
    void *data
    );

t_list    *ft_list_pop(
    t_list **lst
    );

void    ft_sorted_list_insert_elem(
    t_list **begin,
    t_list *new,
    int (*cmp)()
    );

void    ft_sorted_list_insert(
    t_list **begin,
    void *data,
    int (*cmp)()
    );

int ft_list_size(
    t_list *lst
    );

void    ft_list_sort(
    t_list **lst,
    int (*cmp)()
    );

int    ft_list_remove_if(
    t_list **lst,
    void *data_ref,
    int (*cmp)(),
    void (*free_fct)(void *)
    );

/* ************************************************************************** */

#endif