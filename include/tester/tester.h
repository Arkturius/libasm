/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   tester.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rgramati <rgramati@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/06/22 21:09:41 by rgramati          #+#    #+#             */
/*   Updated: 2024/06/23 12:51:21 by rgramati         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef __LIBASM_TESTER_H
# define __LIBASM_TESTER_H

# include <libasm.h>
# include <tester/ansi.h>

# define BOOL_ABS(x) (!!x)

# define CATEGORY(x) (printf(BOLD ITALIC FG_WHITE"TESTING [%s]\n\n", x))

typedef enum e_err_type
{
    LA_ERR_OK = 1u << 0,
    LA_ERR_ALLOC = 1u << 1,
    LA_ERR_WROPT = 1u << 2,
    LA_ERR_FAILS = 1u << 3
}   t_err_type;

typedef enum e_flags
{
    LA_STOPONFAIL = 1u << 0,
    LA_NOPRINT = 1u << 2,
    LA_VALGRIND = 1u << 1,
    LA_DEBUG = 1u << 3,
    LA_FAST_CHECK = 1u << 4
}   t_flags;

typedef struct s_err
{
    t_err_type  type;
    void        *data;
}   t_err;

typedef struct s_tester
{
    t_flags flags;
}   t_tester;

#endif