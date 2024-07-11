#ifndef LIBASM_BONUS_H
# define LIBASM_BONUS_H

typedef struct s_list
{
	void			*data;
	struct s_list	*next;
}					t_list;

int		ft_atoi_base(const char *str, const char *base);
void	ft_list_push_front(t_list **alst, void *data);
int		ft_list_size(t_list *lst);
void	ft_list_sort(t_list **alst, int (*cmp)(void *, void *));
void	ft_list_remove_if(t_list **alst, void *ref, int (*cmp)(void *, void *), void (*free_fct)(void *));

#endif
