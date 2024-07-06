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
	if (!strchr((char *)elem, *(char *)ref))
		return (1);
	return (0);
}

void ft_list_remove_if(t_list **alst, void *data_ref, int (*cmp)())
{
	t_list *current;
	t_list *temp;

	while (*alst && cmp((*alst)->data, data_ref) == 0)
	{
		temp = *alst;
		*alst = (*alst)->next;
		free(temp);
	}
	current = *alst;
	while (current && current->next)
	{
		if (cmp(current->next->data, data_ref) == 0)
		{
			temp = current->next;
			current->next = current->next->next;
			free(temp);
		}
		else
		{
			current = current->next;
		}
	}
}

int	main(void)
{
	t_list	*head;
	char	c;

	head = NULL;
	ft_list_push_front(&head, ft_list_new("aaaa"));
	ft_list_push_front(&head, ft_list_new("bbbb"));
	ft_list_push_front(&head, ft_list_new("aabb"));
	ft_list_push_front(&head, ft_list_new("cccc"));
	print_list(head);
	printf("Size of the list: %d\n", ft_list_size(head));
	ft_list_sort(&head, (void *)&ft_strcmp);
	print_list(head);
	c = 'a';
	ft_list_remove_if(&head, &c, (void *)&contains);
	print_list(head);
	free_list(head);
	return (0);
}
