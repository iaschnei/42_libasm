; ----------------------------------------------------------------------------------------
; Returns the number of characters in a string, excluding the final closing character '\0'
; ----------------------------------------------------------------------------------------

          global    ft_strlen

          section   .text

ft_strlen:
          mov rax, 0                            ; Initialise our return to 0, which is also our counter in this case

loop:
          cmp BYTE [rdi + rax], 0               ; Compare the current character to '\0'
          je  return                            ; If equals, return rax, else loop
          inc rax
          jmp loop

return:
          ret
