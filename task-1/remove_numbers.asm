%include "../include/io.mac"

extern printf
global remove_numbers

section .data
	fmt db "%d", 10, 0

section .text

; function signature: 
; void remove_numbers(int *a, int n, int *target, int *ptr_len);

remove_numbers:
	;; DO NOT MODIFY
	push    ebp
	mov     ebp, esp
	pusha

	mov     esi, [ebp + 8] ; source array
	mov     ebx, [ebp + 12] ; n
	mov     edi, [ebp + 16] ; dest array
	mov     edx, [ebp + 20] ; pointer to dest length

	;; DO NOT MODIFY

	xor eax, eax ; loop counter
	xor edx, edx ; dest current index

check_number:
	mov ecx, [esi + 4 * eax] ; get value from source
	and ecx, 1
	cmp ecx, 0 ; check if even or odd
	jne loop_check_number

	mov ecx, [esi + 4 * eax] ; get value back
	cmp ecx, 0 ; check if zero
	je add_to_target

	push eax ; save value to stack

	mov eax, ecx
	dec eax
	and eax, ecx
	cmp eax, 0

	pop eax ; restore value from stack

	je loop_check_number

add_to_target:
	mov [edi + 4 * edx], ecx ; save value to dest array
	inc edx ; increment index in dest array

loop_check_number:
	inc eax
	cmp eax, ebx
	jl check_number
	
mov ecx, [ebp + 20] ; pointer to dest length
mov [ecx], edx ; update dest length

	;; DO NOT MODIFY

	popa
	leave
	ret
	
	;; DO NOT MODIFY
