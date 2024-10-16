#include <stdio.h>
#include <stdlib.h>

int   ft_strlen(char *str);
char *ft_strcpy(char *dst, const char *src);
int   ft_strcmp(const char *s1, const char *s2);

int main(void) {

  char *str = "Salut";

  printf("%d\n", ft_strlen(str));

  char dest[100];

  printf("%s\n", ft_strcpy(dest, str));

  if (ft_strcmp(str, dest) == 0) {

    printf("Strings are equal\n");
  } else {

    printf("Strings are not equal\n");
  }

}
