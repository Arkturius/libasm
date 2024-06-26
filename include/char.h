/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   char.h                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rgramati <rgramati@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/06/22 21:02:46 by rgramati          #+#    #+#             */
/*   Updated: 2024/06/22 21:09:17 by rgramati         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef __LIBASM_CHAR_H
# define __LIBASM_CHAR_H

/**
* @brief        Check c value against a rule
* 
* @param c      c, treated as unsigned char
*
* @return       2^  if c is an alphanumeric character, 0 otherwise
*/
int ft_isalnum(int c);

/**
* @brief        Check c value against a rule
* 
* @param c      c, treated as unsigned char
*
* @return       2^  if c is an alphabetic character, 0 otherwise
*/
int ft_isalpha(int c);

/**
* @brief        Check c value against a rule
* 
* @param c      c, treated as unsigned char
*
* @return       2^  if c is a control character, 0 otherwise
*/
int ft_iscntrl(int c);

/**
* @brief        Check c value against a rule
* 
* @param c      c, treated as unsigned char
*
* @return       2^  if c is a digit character, 0 otherwise
*/
int ft_isdigit(int c);

/**
* @brief        Check c value against a rule
* 
* @param c      c, treated as unsigned char
*
* @return       2^  if c is a printable character excepting space, 0 otherwise
*/
int ft_isgraph(int c);

/**
* @brief        Check c value against a rule
* 
* @param c      c, treated as unsigned char
*
* @return       2^  if c is a lowercase character, 0 otherwise
*/
int ft_islower(int c);

/**
* @brief        Check c value against a rule
* 
* @param c      c, treated as unsigned char
*
* @return       2^  if c is a printable character, 0 otherwise
*/
int ft_isprint(int c);

/**
* @brief        Check c value against a rule
* 
* @param c      c, treated as unsigned char
*
* @return       2^  if is a punctuation character, 0 otherwise
*/
int ft_ispunct(int c);

/**
* @brief        Check c value against a rule
* 
* @param c      c, treated as unsigned char
*
* @return       2^  if c is a whitespace character, 0 otherwise
*/
int ft_isspace(int c);

/**
* @brief        Check c value against a rule
* 
* @param c      c, treated as unsigned char
*
* @return       2^  if c is an uppercase character, 0 otherwise
*/
int ft_isupper(int c);

/**
* @brief        Check c value against a rule
* 
* @param c      c, treated as unsigned char
*
* @return       2^  if c is an hexadecimal character, 0 otherwise
*/
int ft_isxdigit(int c);


#endif  // __LIBASM_CHAR_H