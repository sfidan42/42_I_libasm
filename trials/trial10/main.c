#include <stdlib.h>
#include <string.h>
#include <stdio.h>

typedef struct s_list
{
	void			*data;
	struct s_list	*next;
}					t_list;

void print(void *data)
{
	printf("%s\n", (char *)data);
}

extern void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)());

t_list	*ft_list_new(void *data)
{
	t_list	*new;

	new = malloc(sizeof(t_list));
	if (new == NULL)
		return (NULL);
	new->data = data;
	new->next = NULL;
	return (new);
}

void	ft_print_list(t_list *list)
{
	while (list)
	{
		printf("%s\n", (char *)list->data);
		list = list->next;
	}
}

int main(void)
{
	t_list	*list;

	list = ft_list_new("aab");
	list->next = ft_list_new("abb");
	list->next->next = ft_list_new("ccb");
	list->next->next->next = ft_list_new("cca");
	ft_list_remove_if(&list, "aab", strcmp);
	ft_list_remove_if(&list, "ccb", strcmp);
	ft_print_list(list);
	return (0);
}
