; ----------------------------------------------------------------------------------------
; Writes a buffer into a fd
; ----------------------------------------------------------------------------------------

          global    ft_write
                    extern __errno_location

          section   .text

ft_write:
          mov	rdx, rdx                      ; message length
          mov rdi, rdi                      ; file descriptor (stdout)
          mov rsi, rsi                      ; string to print
          mov	rax, 1                        ; syscall code for write
          syscall
          jc error
          ret

error:
          mov r8, rax                       ; save write's return value into r8
          call __errno_location wrt ..plt
          mov [rax], r8                     ; sets errno to write's return value
          mov rax, -1
          ret
