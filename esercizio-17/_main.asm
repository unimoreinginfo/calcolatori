.586      
.model flat     
.code   	

_palindromo proc
	
	push ebp
	mov ebp,esp
	push ebx
	push esi
	push edi

	mov esi, 0 ; indice
	mov ecx, dword ptr [ebp + 8] ; stringa qui
	mov edx, 0 ; lunghezza

	call len	
	sub edx, 1
	mov esi, 0

	call is_palindrome

	pop edi
	pop esi
	pop ebx
	mov esp, ebp
	pop ebp

	ret

_palindromo endp 

is_palindrome proc
	
	; edx = lunghezza
	; esi = 0
	; al, bl = esi, bl = edx - esi
	
	pal_loop:
		
		mov eax, 0
		mov ebx, 0
		
		mov al, byte ptr [ecx + esi * 1] ; lettera corrente
		push edx
			sub edx, esi
			cmp esi, edx
			jge end_pal_loop
			mov bl, byte ptr [ecx + edx * 1] ; lettera speculare
		pop edx
		call to_up
		cmp bl, al
		jnz end_not_pal_loop
		inc esi
		jmp pal_loop

	end_not_pal_loop:
		mov eax, 0
		ret
	end_pal_loop:
		pop edx
		mov eax, 1
		ret	

is_palindrome endp

len proc
	
	keep_going:

	cmp byte ptr [ecx + esi * 1], 0
	jz endloop
	inc edx
	inc esi
	jmp keep_going

	endloop: ret

len endp

to_up proc
	
	cmp bl, 90
	jg bl_upper
	jmp bl_not_upper

	bl_upper: sub bl, 32
	bl_not_upper: 

	cmp al, 90
	jg al_upper
	jmp al_not_upper

	al_upper: sub al, 32
	al_not_upper: ret

to_up endp

End