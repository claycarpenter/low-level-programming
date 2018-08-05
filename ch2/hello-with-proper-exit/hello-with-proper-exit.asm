section .data
message: data 'hello, world!', 10

section .text
global _start

_start:
  mov   rax, 1        ; 'write' syscall number
  mov   rdi, 1        ; stdout file descriptor
  mov   rsi, message  ; string address
  mov   rdx, 14       ; string length in bytes
  syscall

  mov   rax, 60       ; 'exit' syscall number
  xor   rdi, rdi      ; set rdi to 0
  syscall
