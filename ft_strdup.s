; ----------------------------------------------------------------------------------------
; Duplicates the given string in a newly allocated one
; -> get the length of the string using ft_strlen
; -> allocate enough memory with malloc
; -> copy the string using ft_strcpy
; ----------------------------------------------------------------------------------------

          global    ft_strdup
                    extern malloc
                    extern __errno_location
                    extern ft_strlen
                    extern ft_strcpy

          section   .text

ft_strdup:
          call ft_strlen                    ; This will store the len in rax
          push rdi                          ; rdi points to the string we need to copy
          inc rax                           ; Account for the null terminating char
          mov rdi, rax                      ; Puts the len as an argument for malloc
          call malloc wrt ..plt             ; Sets rax to the new buffer's adress,  note: wrt ..plt makes a request to find the location of malloc
          jz error
          pop rsi                           ; Retrieve the string to copy into an argument for strcpy
          mov rdi, rax                      ; Puts the new buffer as an argument for strcpy
          call ft_strcpy
          ret                               ; rax is already set to the new buffer

error:
          mov r8, rax                       ; save malloc's return value
          call __errno_location wrt ..plt
          neg r8
          mov [rax], r8                     ; sets errno to malloc's return value
          mov rax, -1
          ret
