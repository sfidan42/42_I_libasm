#include "./inc/libasm.h"
#include "./inc/libasm_bonus.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

void	print(const char *s)
{
	ft_write(1, s, ft_strlen(s));
}

void	print_list(t_list *list)
{
	print("List content:\n");
	while (list)
	{
		print(" -- ");
		if (list->data == 0)
			print("NULL");
		else
			print(list->data);
		print("\n");
		list = list->next;
	}
}

void	free_list(t_list *list)
{
	t_list	*aux;

	while (list)
	{
		aux = list->next;
		free(list);
		list = aux;
	}
}

int	contains(void *elem, void *ref)
{
	char	*str;
	char	c;

	str = elem;
	c = *(char *)ref;
	printf("Compare %s with %c, ", str, c);
	if (!strchr(str, c))
	{
		printf("keep %s\n", str);
		return (1);
	}
	printf("remove %s\n", str);
	return (0);
}

int	main(void)
{
	t_list	*head;
	char	c;

	c = 'a';
	printf("123_16 = %d\n", ft_atoi_base("123", "0123456789abcdef"));
	head = NULL;
	ft_list_remove_if(&head, &c, (void *)&contains, free);
	ft_list_push_front(&head, "ab1");
	ft_list_push_front(&head, "aa2");
	ft_list_push_front(&head, "ba1");
	ft_list_push_front(&head, "bd2");
	ft_list_push_front(&head, "cs1");
	ft_list_push_front(&head, "cr2");
	ft_list_push_front(&head, "da1");
	ft_list_push_front(&head, "db2");
	print_list(head);
	printf("Size of the list: %d\n", ft_list_size(head));
	ft_list_sort(&head, (void *)&ft_strcmp);
	printf("Sorted list:\n");
	print_list(head);
	printf("Removing elements containing %c\n", c);
	ft_list_remove_if(&head, &c, (void *)&contains, free);
	printf("Operation done\n");
	print_list(head);
	free_list(head);
	return (0);
}
