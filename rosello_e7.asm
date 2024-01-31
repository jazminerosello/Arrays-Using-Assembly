; ROSELLO, MA. JAZMINE P.
; 2021-09665
; CMSC 131-U7L

global _start
global find

section .data
    SYS_EXIT equ 60
    num_arr dw 0, -2, 32767, -4, -5
    len dd 5
    largest dw -1
    all_negative db 1

section .text
 

_start:
    mov si, 0 ;para sa i*size
    mov dl, byte[all_negative] ;1 if all negative, 0 if not all negative
    mov cx, word[largest]      ;cx = largest positive number
    mov rbx, num_arr ; rbx = address of num_arr
    call find

    mov byte[all_negative], dl ;para mailagay 'yung value ng dl sa all_negative variable'
    mov word[largest], cx       ;final largest number in largest variable

exit_here:
    mov rax, SYS_EXIT
    xor rdi, rdi
    syscall

find:
    check:
        mov di, word[rbx + rsi] ;di = rbx + rsi, 'yung rsi is the shortcut of i*size
        cmp di, 0              ;compare to 0      
        jge store_largest           ;if di >= 0, then go the store_largest
        ;else, 

        add si, 2                   ;next i*size so bali plus 2 lang since word size is 2

        cmp si, 10                  ;compare if si is equal to 10, kaya 10 kasi sa isang array meron siyang
        ;5 na elements then sicne word array siya, 5*2 is 10
        ;check if all numbers in the array ay nacheck na
        je return ;if equal to 10 then return na

        jmp check ;else tawagin lang uli si check

    ;dito is kinocompare 'yung di if greater ba siya sa current value na nasa cx na naghohold ng value ng largest
    store_largest:
        add si, 2                   ;next i*size so bali plus 2 lang since word size is 2
        mov rdx, 0                  ;all_negative = 0, since napunta rito ang program meanign there is a positive number among the array

        cmp cx, di                  
        jge check                   ;if current number is not the largest then go back to check lang
        ;else, store the value of di to the cx since mas larger ang di as current value gn cx

        mov cx, di                  ;current number becomes largest number

        cmp si, 10   ;compare if si is equal to 10, kaya 10 kasi sa isang array meron siyang
        ;5 na elements then sicne word array siya, 5*2 is 10
        ;check if all numbers in the array ay nacheck na              
        je return ;if equal to 10 then return na

        jmp check ;else tawagin lang uli si check

    return:
        ret