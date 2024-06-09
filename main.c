#include "libasm.h"

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

int	main(void)
{
	char	buffer[1024] = {0};

	print("Hello!\n");
	print("What's your name?\n---> ");
	scan(buffer, 1024);
	print("Nice to meet you ");
	print(buffer);
	print("Goodbye!\n");
	return (0);
}
