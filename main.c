#include <stdio.h>
#include <stdlib.h>

int   ft_strlen(char *str);
char *ft_strcpy(char *dst, const char *src);

int main(void) {

  char *str = "Salut";

  printf("%d\n", ft_strlen(str));

  char dest[100];

  printf("%s\n", ft_strcpy(dest, str));
}
