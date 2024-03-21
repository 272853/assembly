[bits 32]

push 'H'
call [ebx+4]
add esp, 4

push 0
call [ebx]