[bits 32]



call wyswietl
db "Podaj operacje:",0 
wyswietl:
call [ebx+3*4]
add esp, 12

call [ebx+2*4]
push eax
cmp esp, 'd'
jne nie_dodawanie
;dodawanie-->
call wypisz_dodaje
db 'dodaje', 0xa, 0 
wypisz_dodaje:
call [ebx+3*4] 
add esp, 4
jmp koniec


nie_dodawanie:
cmp esp, 'o'
jne mnozenie
;odejmowanie-->
call wypisz_odejmuje
db 'odejmuje', 0xa, 0 
wypisz_odejmuje:
call [ebx+3*4] 
add esp, 4
jmp koniec

mnozenie:
cmp esp, 'm'
jne inne
;mnoznenie-->
call wypisz_mnoze
db 'mnoze', 0xa, 0 
wypisz_mnoze:
call [ebx+3*4] 
add esp, 4
jmp koniec

inne:
call wypisz_inne
db 'inne', 0xa, 0 
wypisz_inne:
call [ebx+3*4] 
add esp, 4
jmp koniec

koniec:
call [ebx]