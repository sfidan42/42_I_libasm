#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef struct	s_list
{
	void			*data;
	struct s_list	*next;
}					t_list;

extern void	ft_list_sort(t_list **begin_list, int (*cmp)());
//{
//	t_list	*ptr;
//	
//	ptr = *begin_list;
//	
//	cmp(ptr->data, ptr->next->data);
//	//ptr = ptr->next;
//	(void)cmp;
//}
//{
//	t_list	*ptr;
//	t_list	*ptr2;
//	t_list	*next;
//
//	ptr = *begin_list;
//	while (ptr)
//	{
//		ptr2 = *begin_list;
//		while (ptr2->next)
//		{
//			if (cmp(ptr2->data, ptr2->next->data) > 0)
//			{
//				next = ptr2->data;
//				ptr2->data = ptr2->next->data;
//				ptr2->next->data = next;
//			}
//			ptr2 = ptr2->next;
//		}
//		ptr = ptr->next;
//	}
//}

int	comp(void *i, void *j)
{
	char	*str1;
	char	*str2;

	str1 = i;
	str2 = j;
	printf("%s vs %s\n", str1, str2);
	return (-strcmp(str1, str2));
}

t_list	*list_new(void *data)
{
	t_list	*node;

	node = (t_list *)malloc(sizeof(t_list));
	node->data = data;
	node->next = NULL;
	return (node);
}

int main(void)
{
	t_list	*lst;
	FILE	*fp;

	lst = list_new("aaa");
	lst->next = list_new("abb");
	lst->next->next = list_new("abc");
	fp = fopen("test.txt", "w");
	for (t_list *ptr = lst; ptr; ptr = ptr->next)
		fprintf(fp, "node address; data: %p, next:%p\n", &(ptr->data), &(ptr->next));
	fclose(fp);
	ft_list_sort(&lst, comp);
	return (0);
}
