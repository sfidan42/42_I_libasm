#include "libasm.h"
#include "libasm_bonus.h"
#include <stdlib.h>

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

int	main(void)
{
	t_list	*head;
	t_list	*new;

	head = NULL;
	new = ft_list_new("Hello\n");
	ft_list_push_front(&head, new);
	print(head->data);
	new = ft_list_new("World\n");
	ft_list_push_front(&head, new);
	print(head->data);
	print(head->next->data);
	free(head->next);
	free(head);
	return (0);
}
