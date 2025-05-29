%include "../include/io.mac"

extern printf
global base64

section .data
	alphabet db 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/'
	fmt db "%d", 10, 0

section .text

base64:
	;; DO NOT MODIFY

	push ebp
	mov ebp, esp
	pusha

	mov esi, [ebp + 8] ; source array
	mov ebx, [ebp + 12] ; n
	mov edi, [ebp + 16] ; dest array
	mov edx, [ebp + 20] ; pointer to dest length

	;; DO NOT MODIFY


	; -- Your code starts here --
	
	mov eax, ebx
	mov ecx, 3

	push edx
	xor edx, edx
	div ecx ; now eax is the number of groups of 3 bytes
	pop edx

	push eax ; push number of groups
	shl eax, 2 ; multiply by 4
	mov ecx, [ebp + 20] ; pointer to dest length
	mov [ecx], eax ; update dest length
	pop eax ; restore number of groups

loop_groups:
	xor ecx, ecx
	mov cl, [esi] ; first character
	shl ecx, 8
	mov cl, [esi + 1] ; second character
	shl ecx, 8
	mov cl, [esi + 2] ; third character

	push eax ; push number of groups of 3 bytes

	push ecx ; push byte group
	shr ecx, 18 ; get first group of 6 bits
	xor eax, eax
	mov al, [alphabet + ecx]
	mov [edi], al
	pop ecx ; restore byte group

	push ecx ; push byte group
	shr ecx, 12 ; get second group of 6 bits
	and ecx, 111111b ; eliminate other bits
	xor eax, eax
	mov al, [alphabet + ecx]
	mov [edi + 1], al
	pop ecx ; restore byte group

	push ecx ; push byte group
	shr ecx, 6 ; get third group of 6 bits
	and ecx, 111111b ; eliminate other bits
	xor eax, eax
	mov al, [alphabet + ecx]
	mov [edi + 2], al
	pop ecx ; restore byte group

	push ecx ; push byte group
	and ecx, 111111b ; get fourth group of 6 bits
	xor eax, eax
	mov al, [alphabet + ecx]
	mov [edi + 3], al
	pop ecx ; restore byte group

	pop eax ; restore number of groups

	add esi, 3
	add edi, 4
	dec eax
	cmp eax, 0
	jg loop_groups

	; -- Your code ends here --


	;; DO NOT MODIFY

	popa
	leave
	ret

	;; DO NOT MODIFY