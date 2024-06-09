#include "libasm.h"

extern void free(void *ptr);

void	print(const char *str)
{
	ft_write(1, str, ft_strlen(str));
}

void	scan(char *buffer, size_t size)
{
	ssize_t	bytes;

	bytes = ft_read(0, buffer, size);
	buffer[bytes] = '\0';
}

void	test1(void)
{
	char	buffer[1024];
	char	buffer2[1024];

	print("Hello!\n");
	print("What's your name?\n---> ");
	scan(buffer, 1024);
	ft_strcpy(buffer2, buffer);
	print("Nice to meet you ");
	print(buffer2);
	print("Goodbye!\n");
}

void	test2(void)
{
	char	*str;

	str = ft_strdup("a\n");
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
	//test1();
	test2();
	//test3();
	return (0);
}
