#include <stdio.h>
#include <stdlib.h>

int   ft_strlen(char *str);
char *ft_strcpy(char *dst, const char *src);
int   ft_strcmp(const char *s1, const char *s2);
int   ft_write(int fd, const char *msg, int len);
char *ft_strdup(const char *s);

// To use main with libasm.a :
//  gcc -Wall -Wextra -Werror main.c libasm.a

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

  ft_write(1, "Salut", 5);

  printf("%s\n", ft_strdup(str));
}
