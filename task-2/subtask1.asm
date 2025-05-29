%include "../include/io.mac"

struc event
    name: resb 31
    valid: resb 1
    day: resb 1
    month: resb 1
    year: resw 1
endstruc

section .data

section .text
    global check_events
    extern printf

check_events:
    ;; DO NOT MODIFY
    enter 0,0
    pusha

    mov ebx, [ebp + 8]      ; events
    mov ecx, [ebp + 12]     ; length
    ;; DO NOT MODIFY

    push ecx
    push eax

    mov eax, ecx
    push edx
    mov edx, 36
    mul edx
    pop edx

    mov ecx, eax
    pop eax

    xor eax, eax ; loop counter

check_date:
    xor edx, edx
    mov dx, word [ebx + eax + 34] ; year

    cmp edx, 1990
    jl invalid_date
    cmp edx, 2030
    jg invalid_date

    xor edx, edx
    mov dl, byte [ebx + eax + 33] ; month

    cmp edx, 1
    jl invalid_date
    cmp edx, 12
    jg invalid_date

    cmp edx, 1
    je jan
    cmp edx, 2
    je feb
    cmp edx, 3
    je mar
    cmp edx, 4
    je apr
    cmp edx, 5
    je may
    cmp edx, 6
    je jun
    cmp edx, 7
    je jul
    cmp edx, 8
    je aug
    cmp edx, 9
    je sep
    cmp edx, 10
    je oct
    cmp edx, 11
    je nov
    cmp edx, 12
    je dec

jan:
    mov esi, 31
    jmp check_day
feb:
    mov esi, 28
    jmp check_day
mar:
    mov esi, 31
    jmp check_day
apr:
    mov esi, 30
    jmp check_day
may:
    mov esi, 31
    jmp check_day
jun:
    mov esi, 30
    jmp check_day
jul:
    mov esi, 31
    jmp check_day
aug:
    mov esi, 31
    jmp check_day
sep:
    mov esi, 30
    jmp check_day
oct:
    mov esi, 31
    jmp check_day
nov:
    mov esi, 30
    jmp check_day
dec:
    mov esi, 31

check_day:
    xor edx, edx
    mov dl, byte [ebx + eax + 32] ; day

    cmp edx, 1
    jl invalid_date
    cmp edx, esi
    jg invalid_date

valid_date:
    mov byte [ebx + eax + 31], 1
    jmp skip_date

invalid_date:
    mov byte [ebx + eax + 31], 0

skip_date:
    add eax, 36
    cmp eax, ecx
    jl check_date

    pop ecx ; restore original length

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY