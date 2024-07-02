#include <stdio.h>

extern void iter(int *arr, void (*f)(void *, void *));
//{
//	size_t i = 0;
//
//	f(&arr[i], &arr[i]);
//	i = i + 1;
//}

void	put(void *i, void *j)
{
	int	*a;
	int	*b;
	
	a = i;
	b = j;
	printf("%d %d\n", *a, *b);
}

int main(void)
{
	int	arr[5] = {9, 10, 11, 12, 13};

	iter(arr, put);
	return (0);
}
