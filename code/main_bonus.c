#include <libasm.h>
#include <libasm_bonus.h>
#include <stdlib.h>
#include <stdio.h>

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

int	main(void)
{
	t_list	*head;

	head = NULL;
	ft_list_push_front(&head, ft_list_new("Hello"));
	ft_list_push_front(&head, ft_list_new("World"));
	print_list(head);
	printf("Size of the list: %d\n", ft_list_size(head));
	free_list(head);
	return (0);
}
