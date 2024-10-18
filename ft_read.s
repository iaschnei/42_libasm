; ----------------------------------------------------------------------------------------
; Reads a file
; ----------------------------------------------------------------------------------------

          global    ft_read
                    extern __errno_location

          section   .text

ft_read:
          mov	rdx, rdx                      ; message length
          mov rdi, rdi                      ; file descriptor (stdout)
          mov rsi, rsi                      ; string to print
          mov	rax, 0                        ; syscall code for read
          syscall
          jz error
          ret

error:
          mov r8, rax                       ; save read's return value into r8
          call __errno_location wrt ..plt
          neg r8
          mov [rax], r8                     ; sets errno to read's return value
          mov rax, -1
          ret
