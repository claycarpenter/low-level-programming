section .data
codes:
    db    '0123456789ABCDEF'

section .text
global _start

_start:
  ; number in hex format
  mov rax, 0x1122334455667788

  ; prepare for write syscall to stdout
  mov rdi, 1  ; fd 1, stdout
  mov rdx, 1  ; write length of 1 byte
  mov rcx, 64

.loop:
  push rax    ; store rax, will be overwriting it for syscall later
  sub rcx, 4  ; subtact rcx value from 4...?

  ; cl is a register, smallest part of rcx
	; rax -- eax -- ax -- ah + al
	; rcx -- ecx -- cx -- ch + cl
  sar rax, cl   ; arithmetic shift right by rax bits
  and rax, 0xf  ; bitwise AND rax, 0xf

  lea rsi, [codes + rax]
  mov rax, 1

  ; syscall leaves rcx, r11 changed
  ; store rcx on stack temporarily to get around this
  push rcx
  syscall
  pop rcx

  pop rax

  ; test can be used for the fastest 'is it a zero?' check
  test rcx, rcx   ; set condition code (ZF) based on rcx & rcx
  jnz .loop       ; jump if not equal/not zero

  ; all done, exit
  mov rax, 60
  xor rdi, rdi
  syscall
