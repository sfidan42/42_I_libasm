#include "libasm.h"

int	main(void)
{
	char	buffer[1024] = {0};
	ssize_t	bytes;

	ft_write(1, "Hello, World!\n", 14);
	ft_write(1, "What's your name?\n---> ", 24);
	bytes = ft_read(0, buffer, 100);
	buffer[bytes] = '\0';
	ft_write(1, "Nice to meet you ", 18);
	ft_write(1, buffer, ft_strlen(buffer));
	ft_write(1, "Goodbye!\n", 9);
	return (0);
}
