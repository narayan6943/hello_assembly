section .data
    msg db 'Hello, World!', 0xA   ; message + newline
    msglen equ $ - msg            ; length of message

section .text
    global _start

_start:
    ; write(1, msg, msglen)
    mov eax, 4        ; syscall number for sys_write
    mov ebx, 1        ; file descriptor (1 = stdout)
    mov ecx, msg      ; pointer to message
    mov edx, msglen   ; message length
    int 0x80

    ; exit(0)
    mov eax, 1        ; syscall number for sys_exit
    xor ebx, ebx      ; exit code 0
    int 0x80

