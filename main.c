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
/*
void	test2(void)
{
	char	*str;

	str = ft_strdup("Hello, world!\n");
	print(str);
	free(str);
}
*/

int	main(void)
{
	test1();
	//test2();
	return (0);
}
