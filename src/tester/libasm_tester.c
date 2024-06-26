/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm_tester.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rgramati <rgramati@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/06/04 17:59:00 by rgramati          #+#    #+#             */
/*   Updated: 2024/06/25 16:33:42 by rgramati         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <unistd.h>
#include <stdbool.h>
#include <tester/tester.h>

static void err_print(
	t_err *err
)	{
	if (err->type == LA_ERR_OK)
	{
		printf(BOLD"[%s]"FG_BLUE" done.\n"RESET, (char *)err->data);
		return ;
	}
	if (err->type == LA_ERR_ALLOC)
		printf(BOLD FG_RED"[Error] Allocation failed during {%s}.\n"RESET, (char *)err->data);
	else if (err->type == LA_ERR_WROPT)
		printf(BOLD FG_RED"[Error] Unrecognised option {-%c}.\n"RESET, *(char *)err->data);
	else
		printf(BOLD FG_RED"[Error] Failed here: %s\n"RESET, (char *)err->data);
}

#include <ctype.h>

static void	define_flags(
	int argc,
	char **argv,
	t_tester *tester,
	t_err *err
)	{
	char	**tmp;
	char	*flag;
	int		index;

	tmp = argv + 1;
	while (tmp - argv < argc)
	{
		if (*tmp && **tmp == '-')
		{
			flag = *tmp + 1;
			while (*flag && !ft_isspace(*flag))
			{
				index = ft_strindex("snvdf", *flag);
				if (index != -1)
					tester->flags |= 1u << index;
				else
				{
					*err = (t_err){.type = LA_ERR_WROPT, .data = &(*flag)};
					err_print(err);
					return ;
				}
				flag++;
			}
		}
		tmp++;
	}
}

static void la_check_char_fcts(t_tester *tester, t_err *err)
{
	/* Char verification functions */
	int		f_index = 0;
	char	*fcts_names[11] = {"isalnum", "isalpha", "iscntrl", "isdigit", "isgraph", "islower", "isprint", "ispunct", "isspace", "isupper", "isxdigit"};
	int		(*lc_char_fcts[11])(int) = {isalnum, isalpha, iscntrl, isdigit, isgraph, islower, isprint, ispunct, isspace, isupper, isxdigit};
	int		(*la_char_fcts[11])(int) = {ft_isalnum, ft_isalpha, ft_iscntrl, ft_isdigit, ft_isgraph, ft_islower, ft_isprint, ft_ispunct, ft_isspace, ft_isupper, ft_isxdigit};
	int		tested_char;
	int		fail_count;
	int		lc_result;
	int		la_result;

	CATEGORY("Char against characteristics");
	while (f_index < 11)
	{
		fail_count = 0;
		tested_char = 0;
		while (tested_char < 256)
		{
			printf(BOLD FG_BLUE"\r\t[Checking...]"FG_WHITE"\t%s  \t: %3d/256"RESET, fcts_names[f_index], tested_char + 1);
			lc_result = lc_char_fcts[f_index](tested_char);
			la_result = la_char_fcts[f_index](tested_char);
			if (BOOL_ABS(lc_result) != BOOL_ABS(la_result))
			{
				if (tester->flags & LA_DEBUG)
					printf(BOLD FG_RED"\n\t%s(%d) = [%d] != ft_%s(%d) = [%d]"RESET, fcts_names[f_index], tested_char, lc_result, fcts_names[f_index], tested_char, la_result);
				fail_count++;
				if (tester->flags & LA_STOPONFAIL)
					break ;
				else if (tester->flags)
					printf("\n");
			}
			tested_char++;
			if (!(tester->flags & LA_FAST_CHECK))
				usleep(1000);
		}
		if (fail_count)
		{
			printf(BOLD FG_RED"\tFAILED:\t%3d/256\n"RESET, fail_count);	
			if (tester->flags & LA_STOPONFAIL)
			{
				*err = (t_err){.type = LA_ERR_FAILS, .data = (void *)fcts_names[f_index]};
				break ;
			}
		}
		else
			printf(BOLD FG_GREEN"\tPASSED !\n"RESET);
		f_index++;
	}
}

void	*ft_memset(void *s, int c, size_t n);

int		ft_memcmp(void *s1, void *s2, size_t n);

void	*ft_memcpy(void *dest, void *src, size_t n);

void	*ft_memmove(void *dest, void *src, size_t n);

void	*ft_memchr(void *dest, int c, size_t n);

void	*ft_bzero(void *s, size_t n);

void	*ft_calloc(size_t nb, size_t size);

size_t	ft_strlcat(char *dst, char *src, size_t n);

#include <string.h>

size_t strlcat(dst, src, siz)
	char *dst;
	const char *src;
	size_t siz;
{
	register char *d = dst;
	register const char *s = src;
	register size_t n = siz;
	size_t dlen;

	/* Find the end of dst and adjust bytes left but don't go past end */
	while (n-- != 0 && *d != '\0')
		d++;
	dlen = d - dst;
	n = siz - dlen;

	if (n == 0)
		return(dlen + strlen(s));
	while (*s != '\0') {
		if (n != 1) {
			*d++ = *s;
			n--;
		}
		s++;
	}
	*d = '\0';

	return(dlen + (s - src));	/* count does not include NUL */
}

int main(
	__attribute__((unused)) int argc,
	__attribute__((unused)) char **argv,
	__attribute__((unused)) char **envp
)   {
	t_tester	tester = {0};
	t_err		err = {0};
	char		buf[128];

	if (argc != 1)
		define_flags(argc, argv, &tester, &err);
	if (err.type)
	{
		printf(BOLD FG_YELLOW"[WARNING] wrong flag detected, wanna continue (Y/anything) ?: ");
		fflush(stdout);
		ft_read(STDIN_FILENO, buf, 128);
		buf[0] &= -33;
		if (buf[0] != 'Y')
			exit(EXIT_FAILURE);
	}

	char	test[1024] = {0};

	int res;

	printf("REAL STRLCAT\n\n");
	ft_bzero(&test, 16);
	res = strlcat(test, "bonjour", 5);
	printf("strlcat = %d\nstring is [%s]\n\n", res, test);

	res = strlcat(test, "", 10);
	printf("strlcat = %d\nstring is [%s]\n\n", res, test);

	ft_bzero(&test, 16);
	res = strlcat(test, "bonjour", 8);
	printf("strlcat = %d\nstring is [%s]\n\n", res, test);

	ft_bzero(&test, 16);
	res = strlcat(test, "bonjour", 8);
	printf("strlcat = %d\nstring is [%s]\n\n", res, test);

	res = strlcat(test, "bonjour", 12);
	printf("strlcat = %d\nstring is [%s]\n\n", res, test);



	printf("MY STRLCAT\n\n");
	ft_bzero(&test, 16);
	test[4] = '+';
	res = ft_strlcat(test, "bonjour", 5);
	printf("strlcat = %d\nstring is [%s]\n\n", res, test);

	res = ft_strlcat(test, "", 10);
	printf("strlcat = %d\nstring is [%s]\n\n", res, test);

	ft_bzero(&test, 16);
	res = ft_strlcat(test, "bonjour", 8);
	printf("strlcat = %d\nstring is [%s]\n\n", res, test);

	ft_bzero(&test, 16);
	res = ft_strlcat(test, "bonjour", 8);
	printf("strlcat = %d\nstring is [%s]\n\n", res, test);

	res = ft_strlcat(test, "bonjour", 12);
	printf("strlcat = %d\nstring is [%s]\n\n", res, test);
	// la_check_char_fcts(&tester, &err);
	
}

