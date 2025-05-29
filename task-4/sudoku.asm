%include "../include/io.mac"

extern printf
global check_row
global check_column
global check_box
; you can declare any helper variables in .data or .bss

section .text


; int check_row(char* sudoku, int row);
check_row:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi

    mov     esi, [ebp + 8]  ; char* sudoku, pointer to 81-long char array
    mov     edx, [ebp + 12]  ; int row 
    ;; DO NOT MODIFY
   
    ;; Freestyle starts here

    mov eax, edx
    mov ebx, 9
    mul ebx
    lea ecx, [esi + eax] ; get pointer to start of the row

    mov al, 1 ; current digit

digit_loop:
    mov edi, 0 ; 0 - not found digit, 1 - found digit
    mov ebx, 0 ; column index

search_loop:
    xor edx, edx
    mov dl, byte [ecx + ebx] ; get digit at current column
    cmp al, dl
    jne continue_search

found_digit:
    cmp edi, 0 ; check if digit is already found
    jne not_okay_row ; if digit is already found then it's a double
    mov edi, 1 ; mark the digit as found

continue_search:
    inc ebx ; increment column index
    cmp ebx, 8
    jle search_loop

    cmp edi, 1 ; check if we found digit once
    jne not_okay_row

    inc eax
    cmp eax, 9
    jle digit_loop

    mov eax, 1 ; row is ok
    jmp end_check_row

not_okay_row:
    mov eax, 2 ; row is not okay

    ;; MAKE SURE TO LEAVE YOUR RESULT IN EAX BY THE END OF THE FUNCTION
    ;; Remember: OK = 1, NOT_OKAY = 2
    ;; ex. if this row is okay, by this point eax should contain the value 1 

    ;; Freestyle ends here
end_check_row:
    ;; DO NOT MODIFY

    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    leave
    ret
    
    ;; DO NOT MODIFY

; int check_column(char* sudoku, int column);
check_column:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi

    mov     esi, [ebp + 8]  ; char* sudoku, pointer to 81-long char array
    mov     edx, [ebp + 12]  ; int column 
    ;; DO NOT MODIFY

    ;; Freestyle starts here

    xor eax, eax
    mov al, 1; current digit

digit_loop_column:
    mov edi, 0 ; 0 - not found digit, 1 - found digit
    mov ebx, 0 ; line index

search_loop_column:
    mov ecx, ebx
    imul ecx, 9
    add ecx, edx
    
    mov cl, byte [esi + ecx] ; get digit
    cmp al, cl
    jne continue_search_column
    
    cmp edi, 1 ; check if already found
    je not_okay_column ; if already found column is invalid
    mov edi, 1 ; mark as found
    
continue_search_column:
    inc ebx ; increment row
    cmp ebx, 9
    jl search_loop_column

    cmp edi, 0 ; check if digit was found
    je not_okay_column
    
    inc eax ; increment digit
    cmp eax, 9
    jle digit_loop_column
    
    mov eax, 1 ; column is not ok
    jmp end_check_column
    
not_okay_column:
    mov eax, 2 ; column is not ok

    ;; MAKE SURE TO LEAVE YOUR RESULT IN EAX BY THE END OF THE FUNCTION
    ;; Remember: OK = 1, NOT_OKAY = 2
    ;; ex. if this column is okay, by this point eax should contain the value 1 

    ;; Freestyle ends here

end_check_column:
    ;; DO NOT MODIFY

    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    leave
    ret
    
    ;; DO NOT MODIFY

; int check_box(char* sudoku, int box);
check_box:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi

    mov     esi, [ebp + 8]  ; char* sudoku, pointer to 81-long char array
    mov     edx, [ebp + 12]  ; int box 
    ;; DO NOT MODIFY
   
    ;; Freestyle starts here



    ;; MAKE SURE TO LEAVE YOUR RESULT IN EAX BY THE END OF THE FUNCTION
    ;; Remember: OK = 1, NOT_OKAY = 2
    ;; ex. if this box is okay, by this point eax should contain the value 1 

    ;; Freestyle ends here
end_check_box:
    ;; DO NOT MODIFY

    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    leave
    ret
    
    ;; DO NOT MODIFY
