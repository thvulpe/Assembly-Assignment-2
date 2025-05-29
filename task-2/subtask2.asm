%include "../include/io.mac"

; declare your structs here

struc event
    name: resb 31
    valid: resb 1
    day: resb 1
    month: resb 1
    year: resw 1
endstruc

section .text
    global sort_events
    extern printf

sort_events:
    ;; DO NOT MODIFY
    enter 0, 0
    pusha

    mov ebx, [ebp + 8]      ; events
    mov ecx, [ebp + 12]     ; length
    ;; DO NOT MODIFY

    ;; Your code starts here

    mov edx, [ebp + 12] ; length for big loop

big_loop:
    push ebx ; push pointer to events array start
    mov ecx, [ebp + 12] ; length

small_loop:
    push ebx ; push pointer to first event
    
    add ebx, 36 ; go to next event
    push ebx ; push pointer to second event

    call compare_events
    add esp, 8 ; clean stack

    dec ecx
    cmp ecx, 2
    jge small_loop

    pop ebx ; restore pointer to events array start

    dec edx
    cmp edx, 0
    jg big_loop

    ;; Your code ends here

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY

compare_events:
    enter 0,0
    pusha

    mov eax, [ebp + 12] ; first event
    mov ebx, [ebp + 8] ; second event

check_validity:
    xor ecx, ecx
    xor edx, edx

    mov cl, byte [eax + 31] ; first valid
    mov dl, byte [ebx + 31] ; second valid

    cmp cl, dl
    jg finish_compare
    jl swap_events

check_year:
    xor ecx, ecx
    xor edx, edx

    mov cx, word [eax + 34] ; first year
    mov dx, word [ebx + 34] ; second year

    cmp cx, dx
    jl finish_compare
    jg swap_events

check_month:
    xor ecx, ecx
    xor edx, edx

    mov cl, byte [eax + 33] ; first month
    mov dl, byte [ebx + 33] ; second moth

    cmp cl, dl
    jl finish_compare
    jg swap_events

check_day:
    xor ecx, ecx
    xor edx, edx

    mov cl, byte [eax + 32] ; first day
    mov dl, byte [ebx + 32] ; second day

    cmp cl, dl
    jl finish_compare
    jg swap_events

check_name:
    push ecx
    xor ecx, ecx ; current character position

check_name_loop:
    push eax ; push first event
    push ebx ; push second event
    add eax, ecx
    add ebx, ecx

    xor ecx, ecx
    xor edx, edx

    mov cl, byte [eax] ; first character
    mov dl, byte [ebx] ; second character

    cmp cl, dl
    pop ebx
    pop eax
    pop ecx
    jl finish_compare
    jg swap_events

    inc ecx
    cmp ecx, 31
    jl check_name_loop

    jmp finish_compare

swap_events:
    mov ecx, 9 ; number of dwords to swap

swap_dwords:
    push ecx ; push remaining number of dwords

    mov ecx, dword [eax] ; current dword from first event
    mov edx, dword [ebx] ; current dword from second event

    mov dword [eax], edx
    mov dword [ebx], ecx

    pop ecx ; restore remaining number of dwords
    add eax, 4
    add ebx, 4

    dec ecx
    cmp ecx, 0
    jg swap_dwords

finish_compare:
    popa
    leave
    ret