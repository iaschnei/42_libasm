#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <fcntl.h>

int       ft_strlen(char *str);
char      *ft_strcpy(char *dst, const char *src);
int       ft_strcmp(const char *s1, const char *s2);
size_t    ft_write(int fd, const void *msg, size_t len);
size_t    ft_read(int fd, void *buff, size_t count);
char      *ft_strdup(const char *s);

// To use main with libasm.a :
//  gcc -Wall -Wextra -Werror main.c libasm.a

int main(void) {

  printf("\x1b[33m-------- Testing ft_strlen: \n\x1b[0m");

  char *str = "Salut";

  printf("[%s] length is : %d\n", str, ft_strlen(str));

  char *str2 = "Bonjour c'est super l'asm";

  printf("[%s] length is : %d\n", str2, ft_strlen(str2));

  printf("\x1b[33m-------- Testing ft_strcpy: \n\x1b[0m");

  char dest[100];

  printf("[%s] copy is : %s\n", str2, ft_strcpy(dest, str2));

  printf("\x1b[33m-------- Testing ft_strcmp: (0 means the two strings are equal)\n\x1b[0m");

  printf("Comparing [%s] and [%s] = %d\n", str2, dest, ft_strcmp(str2, dest));

  printf("Comparing [%s] and [%s] = %d\n", str, str2, ft_strcmp(str, str2));

  printf("\x1b[33m-------- Testing ft_write: \x1b[0m\n");

  char *str3 = "Coucou c'est ft_write\n";

  ft_write(1, str3, ft_strlen(str3));

  printf("Now writing into /dev/null, will fail :\n");

  int fd_null = open("/dev/null", O_RDONLY);

  ft_write(fd_null, str3, ft_strlen(str3));

  printf("Errno is : %s\n", strerror(errno));

  printf("\x1b[33m-------- Testing ft_read: \n\x1b[0m");

  int fd = open("test.txt", O_RDONLY);

  char buff[14];

  buff[13] = 0;

  ft_read(fd, buff, 13);

  printf("Read : %s\n", buff);

  printf("Now reading a non existing file, will fail :\n");

  ft_read(42, buff, 1);

  printf("Errno is : %s\n", strerror(errno));

  printf("\x1b[33m-------- Testing ft_strdup: \n\x1b[0m");
  // causes leaks but whatever

  printf("Duplicating [%s] = %s\n", str, ft_strdup(str));

  printf("Duplicating [%s] = %s\n", str2, ft_strdup(str2));

}
