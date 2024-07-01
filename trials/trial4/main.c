#include <stdio.h>

extern void iter(int *arr, void (*f)(int));
//{
//	size_t i = 0;
//
//	f(arr[i]);
//	i = i + 1;
//}

void	put(int i)
{
	printf("%d\n", i);
}

int main(void)
{
	int	arr[5] = {9, 10, 11, 12, 13};

	iter(arr, put);
	return (0);
}
