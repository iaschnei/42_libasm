; ----------------------------------------------------------------------------------------
; Returns the number of characters in a string, excluding the final closing character '\0'
; To assemble and run:
;
;     nasm -felf64 ft_strlen.s && ld ft_strlen.o && ./a.out
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
