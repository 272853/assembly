[bits 32]



call wyswietl
db "Podaj operacje:",0 
wyswietl:
call [ebx+3*4]
add esp, 8

call [ebx+2*4]
push eax
cmp esp, '+'
jne nie_dodawanie
;dodawanie-->
call wypisz_dodaje
db 'dodaje', 0xa, 0 ;db wzuca miezdzy kod te dane
wypisz_dodaje:
call [ebx+3*4] 
add esp, 4


nie_dodawanie:
cmp esp, '-'
jne mnozenie
;odejmowanie-->
call wypisz_odejmuje
db 'odejmuje', 0xa, 0 ;db wzuca miezdzy kod te dane
wypisz_odejmuje:
call [ebx+3*4] 
add esp, 4


mnozenie:
cmp esp, '*'
jne inne
;mnoznenie-->
call wypisz_mnoze
db 'mnoze', 0xa, 0 ;db wzuca miezdzy kod te dane
wypisz_mnoze:
call [ebx+3*4] 
add esp, 4


inne:
call wypisz_inne
db 'inne', 0xa, 0 ;db wzuca miezdzy kod te dane
wypisz_inne:
call [ebx+3*4] 
add esp, 4

call [ebx]