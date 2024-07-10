#include <libasm.h>
#include <libasm_bonus.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

void	print(const char *s)
{
	ft_write(1, s, ft_strlen(s));
}

t_list	*ft_list_new(void *data)
{
	t_list	*new;

	new = (t_list *)malloc(sizeof(t_list));
	if (!new)
		return (0);
	new->data = data;
	new->next = 0;
	return (new);
}

void	print_list(t_list *list)
{
	print("List content:\n");
	while (list)
	{
		print(" -- ");
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
	printf("Comparing %s with %c\n", str, c);
	if (strchr(str, c))
		return (1);
	return (0);
}

extern void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)());

int	main(void)
{
	t_list	*head;
	char	c;

	head = NULL;
	ft_list_push_front(&head, ft_list_new("a1"));
	ft_list_push_front(&head, ft_list_new("a2"));
	ft_list_push_front(&head, ft_list_new("b1"));
	ft_list_push_front(&head, ft_list_new("b2"));
	ft_list_push_front(&head, ft_list_new("c1"));
	ft_list_push_front(&head, ft_list_new("c2"));
	ft_list_push_front(&head, ft_list_new("d1"));
	ft_list_push_front(&head, ft_list_new("d2"));
	print_list(head);
	printf("Size of the list: %d\n", ft_list_size(head));
	ft_list_sort(&head, (void *)&ft_strcmp);
	printf("Sorted list:\n");
	print_list(head);
	c = 'a';
	printf("Removing elements containing %c\n", c);
	ft_list_remove_if(&head, &c, (void *)&contains);
	printf("Operation done\n");
	print_list(head);
	free_list(head);
	return (0);
}
