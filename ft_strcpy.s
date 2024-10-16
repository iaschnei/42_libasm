; ----------------------------------------------------------------------------------------
; Copies the content of src into the buffer pointed by dest
; ----------------------------------------------------------------------------------------

          global    ft_strcpy

          section   .text

ft_strcpy:
          mov rax, 0

loop:
          mov rbx, [rsi + rax]
          mov [rdi + rax], rbx
          inc rax
          cmp BYTE [rsi + rax], 0
          je  return
          jmp loop

return:
          mov rax, rdi
          ret
