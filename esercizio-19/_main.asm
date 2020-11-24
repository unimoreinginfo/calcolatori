.586      
.model flat     
.code   	

_conta_occorrenze proc
	
	push ebp
	mov ebp,esp
	push ebx
	push esi
	push edi
	push 0

	mov esi, 0 ; indice
	mov ecx, dword ptr [ebp + 8] ; stringa1 qui
	mov edx, dword ptr [ebp + 12] ; stringa2 qui 
	mov eax, 0 

	loop_here:
		cmp byte ptr [ecx + esi * 1], 0
		jz abbiam_finito

		push ebx
			call check_word
			cmp ebx, 1
			jnz found_word
			jmp over
			found_word:
				pop ebx
				pop eax
				inc eax
				push eax
				push ebx
		over:
		pop ebx

	jmp loop_here

	abbiam_finito: pop eax

	pop edi
	pop esi
	pop ebx
	mov esp, ebp
	pop ebp

	ret

_conta_occorrenze endp 

check_word proc
	
	mov eax, 0
	mov ebx, 0
	loop_word:
		mov bl, byte ptr [ecx + esi * 1]
		cmp byte ptr [edx + eax * 1], bl
		jnz gg
		inc esi
		inc eax
		cmp byte ptr [ecx + esi * 1], ' '
		jz adieu
		cmp byte ptr [ecx + esi * 1], 0
		jz adieu
		jmp loop_word
	gg:
		mov ebx, 1
		cmp byte ptr [ecx + esi * 1], ' '
		jz adieu
		cmp byte ptr [ecx + esi * 1], 0
		jz adieu
		inc esi
		jmp gg

	adieu: 
	inc esi
	ret

check_word endp

is_found proc
	
	cmp ebx, 1
	jnz found
	jmp nope
	found: 
		pop ebx
		inc ebx
		push ebx
	
	nope: 
	mov eax, 0
	mov ebx, 0

	ret

is_found endp

End