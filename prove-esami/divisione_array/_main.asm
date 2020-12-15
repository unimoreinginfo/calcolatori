.586      
.model flat     
.code   	

_divisione_array proc
	
	push ebp
	mov ebp,esp
	push ebx
	push esi
	push edi
	
	mov eax, dword ptr[ebp + 8] ; vettore dividendi
	mov ebx, dword ptr[ebp + 12] ; divisore
	mov ecx, dword ptr[ebp + 16] ; lunghezza
	mov edx, dword ptr[ebp + 20] ; vettore resto

	mov esi, 0 ; indice

	; dividere tutti gli elementi del vettore dividendi per il divisore
	; se tutte le divisioni producono resto 0, ritornare -1
	; se tutte le divisioni producono resto diverso da 0 ritornare 1
	; mettere i resti nel vettore resto

	cycle:
		cmp esi, ecx
		je done
		
		call do_division

		; resettiamo tutto il casino che ho fatto nella funzione
		mov eax, dword ptr[ebp + 8] ; vettore dividendi
		mov ebx, dword ptr[ebp + 12] ; divisore
		mov ecx, dword ptr[ebp + 16] ; lunghezza
		mov edx, dword ptr[ebp + 20] ; vettore resto

		inc esi
		jmp cycle
		
	done:

	mov esi, 0
	mov eax, 0
	mov ebx, 0

	count_cycle:
		cmp ecx, esi
		je done_count
		cmp dword ptr[edx + esi * 4], 0
		jnz not_zero
		inc eax
		jmp h
		not_zero:
		inc ebx

		h:
		inc esi
		jmp count_cycle

	done_count:
	cmp eax, ecx
	je all_0
	cmp ebx, ecx
	je all_not_0
	jmp hop
	all_0:
	mov eax, -1
	jmp hop
	all_not_0:
	mov eax, 1

	hop:

	pop edi
	pop esi
	pop ebx
	mov esp, ebp
	pop ebp

	ret

_divisione_array endp 

do_division proc
	
	push edx ; non ho altri posti in cui salvare l'indirizzo del vettore di resti, quindi lo metto sullo stack
	mov ecx, eax ; salviamo l'indirizzo
	mov eax, dword ptr[eax + esi * 4] ; dividendo
	cdq
	idiv ebx

	mov dword ptr[ecx + esi * 4], eax
	pop ecx ; e lo rimetto su ecx 
	mov dword ptr[ecx + esi * 4], edx

	ret

do_division endp

End