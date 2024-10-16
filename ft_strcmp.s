; ----------------------------------------------------------------------------------------
; Compare the contents of two strings, returns 0 if they're equal
; ----------------------------------------------------------------------------------------

          global    ft_strcmp

          section   .text

ft_strcmp:
          mov rax, 0

loop:
          mov bl, BYTE[rdi + rax]             ; Storing the lowest BYTE of rdi+rax indicating the ascii value of the char
          mov cl, BYTE[rsi + rax]             ; Note that using al instead of bl or cl would cause issues as we're increasing rax
          cmp bl, cl
          je equal
          jg greater
          jmp less


equal:
          cmp bl, 0
          je return
          inc rax
          jmp loop

greater:
          mov rax, 1
          ret

less:
          mov rax, -1
          ret

return:
          mov rax, 0
          ret
