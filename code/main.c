#include <libasm.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void	print(const char *s)
{
	ft_write(1, s, ft_strlen(s));
}

void	scan(char *buffer, size_t size)
{
	ssize_t	bytes;

	bytes = ft_read(0, buffer, size);
	buffer[bytes] = '\0';
}

void	test1(void)
{
	int		bytes;
	char	buffer[1024];
	char	buffer2[1024];

	print("Hello!\n");
	print("What's your name?\n---> ");
	scan(buffer, 1024);
	ft_strcpy(buffer2, buffer);
	print("Nice to meet you ");
	print(buffer2);
	print("Goodbye!\n");
	print("Now I will test some error cases.\n");
	print("try to read from -1\n");
	bytes = ft_read(-1, buffer, 1024);
	if (bytes < 0)
		perror("ft_read");
	print("try to read from 10\n");
	bytes = ft_read(10, buffer, 2);
	if (bytes < 0)
		perror("ft_read");
	print("try to read to NULL buffer (Please enter some data)\n");
	bytes = ft_read(0, NULL, 10);
	if (bytes < 0)
		perror("ft_read");
	print("try to write to -1\n");
	bytes = ft_write(-1, "Hello\n", 6);
	if (bytes < 0)
		perror("ft_write");
	print("try to write to 10\n");
	bytes = ft_write(10, "Hello\n", 6);
	if (bytes < 0)
		perror("ft_write");
	print("try to write to NULL buffer\n");
	bytes = ft_write(1, NULL, 6);
	if (bytes < 0)
		perror("ft_write");
}

void	test2(void)
{
	char	*str;

	str = ft_strdup("Here is the string copied by ft_strdup\n");
	print("copied\n");
	print(str);
	print("printed\n");
	free(str);
}

void	print_cmp(const char *s1, const char *s2)
{
	int	i;

	i = ft_strcmp(s1, s2);
	print(s1);
	print(" vs ");
	print(s2);
	print(" = ");
	if (i < 0)
		print("smaller");
	else if (i == 0)
		print("equal");
	else
		print("bigger");
	print("\n");
}

void	test3(void)
{
	print_cmp("hello", "hello");
	print_cmp("hello", "world");
	print_cmp("world", "hello");
}

int	main(void)
{
	print("Welcome to libasm test!\n");
	print("------------------------------------------\n");
	print("I will ask your name and say hello to you.\n");
	print("------------------------------------------\n");
	test1();
	print("------------------------------------------\n");
	print("I will copy a string using ft_strdup and print it.\n");
	print("------------------------------------------\n");
	test2();
	print("------------------------------------------\n");
	print("I will compare some strings using ft_strcmp.\n");
	print("------------------------------------------\n");
	test3();
	return (0);
}
