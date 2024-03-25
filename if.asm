[bits 32]

; ESP -> [RET]
; ESP -> [a] [b] [RET}

mov ebp, esp
sub esp, 8

lea eax, [ebp-4] 
push eax
lea eax, [ebp-8]
push eax
call do_scan
db "%i %i",0 
do_scan:
call [ebx+4*4]
add esp, 12

mov eax, [ebp-8]
sub eax, [ebp-4]

push eax

jz wypisz_0
js wypisz_ujemna

push '>'
call[ebx+4]
jmp wynik


wypisz_0:
push '='
call[ebx+4]
jmp wynik

wypisz_ujemna:
push '<'
call[ebx+4]
jmp wynik

wynik:
add esp, 4

call wypisz_wynik
db "Wynik: %i", 0xa, 0
wypisz_wynik:
call [ebx+3*4]
add esp, 8

push 0
call [ebx]

