#ifndef LIBASM_H
# define LIBASM_H

typedef unsigned long size_t;
typedef long ssize_t;

ssize_t	ft_write(int fd, const void *buf, size_t count);
ssize_t	ft_read(int fd, const void *buf, size_t count);
size_t	ft_strlen(const char *s);
char	*ft_strcpy(char *dest, const char *src);
char	*ft_strdup(const char *s);
int		ft_strcmp(const char *s1, const char *s2);

#endif
