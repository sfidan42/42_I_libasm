#include <stdio.h>

extern void iter(int *arr, int (*f)(void *, void *));
//{
//	size_t i = 0;
//
//	f(&arr[i], &arr[i]);
//	i = i + 1;
//}

int	comp(void *i, void *j)
{
	int	a;
	int	b;

	a = *(int *)i;
	b = *(int *)j;
	printf("%d vs %d: %d\n", a, b, a - b);
	return (a - b);
}

int main(void)
{
	int	arr[5] = {13, 12, 11, 10, 9};

	iter(arr, comp);
	return (0);
}
