#include "libasm.h"
#include <string.h>

int	main(void)
{
	char	buffer[100] = {0};
	ssize_t	bytes;

	bytes = ft_read(0, buffer, 100);
	buffer[bytes] = '\0';
	ft_write(1, "Hello, World!\n", 14);
	ft_write(1, buffer, strlen(buffer));
	ft_write(1, "Nice to meet you!\n", 18);
	ft_write(1, "Goodbye!\n", 9);
	return (0);
}
