[bits 32]

call [ebx+2*4];getchar
;eax ==znak

cmp eax, 'A'
jne dalej; jump if no equal

call wypisz_hello ; przywołuje wypisz_hello ale zapisuje do stosu 
;adres nastepnej instukcji czyli tego co chcemy wyswietlic
db 'hello world', 0xa, 0; dane
wypisz_hello:
call [ebx+3*4]; printf
add esp, 4 ; czysci stos czyli adres instrukcji pod call
;czyli naszych danych
call [ebx]

dalej:
call wypisz_xyz
db 'xyz', 0xa, 0 ;db wzuca miezdzy kod te dane
wypisz_xyz:
call [ebx+3*4] 
add esp, 4
call [ebx] ;exit


