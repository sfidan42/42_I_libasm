#include <libasm.h>
#include <libasm_bonus.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdbool.h>

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

char *ft_strchr(char *str, char c)
{
	printf("Searching for %c in %s, ", c, str);
	while (*str)
	{
		if (*str == c)
		{
			printf("found.\n");
			return (str);
		}
		str++;
	}
	printf("not found.\n");
	return (0);
}

bool valid_base(char *base);

int ref_ft_atoi_base(char *str, char *base)
{
	long int nb;
	int radix;
	bool is_negative;

	if (!valid_base(base))
		return 0;
	while (isspace(*str))
		str++;
	is_negative = false;
	while (*str == '+' || *str == '-')
		if (*str++ == '-')
			is_negative = !is_negative;
	radix = strlen(base);
	nb = 0;
	while (*str && strchr(base, *str) != NULL)
	{
		nb *= radix;
		nb += strchr(base, *str) - base;
		str++;
	}
	return is_negative ? -nb : nb;
}

int	main(void)
{
	char	c;
	t_list	*head;

	//printf("norm; \"\t\n\r\v\f\r 47\" \"01234\" = %d\n", ft_atoi_base("\t\n\r\v\f\r 442", "01234"));
	//printf("ref; \"\t\n\r\v\f\r 47\" \"01234\" = %d\n", ref_ft_atoi_base("\t\n\r\v\f\r 442", "01234"));
	printf("ref; \"10\" \"011\" = %d\n", ref_ft_atoi_base("10", "011"));
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
	c = 'a';
	ft_list_remove_if(&head, &c, (void *)&contains, free);
	printf("Operation done\n");
	print_list(head);
	free_list(head);
	return (0);
}
