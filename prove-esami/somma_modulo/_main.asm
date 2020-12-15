.586      
.model flat     
.code   	

_somma_modulo proc
	
	push ebp
	mov ebp,esp
	push ebx
	push esi
	push edi
	
	mov eax, dword ptr[ebp + 8] ; vettore dividendi
	mov ebx, dword ptr[ebp + 12] ; lunghezza vettori
	mov ecx, dword ptr[ebp + 16] ; vettore resti
	mov edx, dword ptr[ebp + 20] ; divisore

	mov esi, 0 ; indice

	; la funzione deve restituire la somma del resto della divisione intera degli elementi di src per divisore.
	; se tutti i numeri in src sono divisibili per divisore. Ritornare -1
	; se tutti i numeri in src NON sono divisibili per divisore. Ritornare -2
	; inserire all’ interno del vettore dst il resto della divisione in corrispondenza dell’indice dell’elemento diviso in src
	
	cycle:
		cmp esi, ebx
		je done
		
		call divide
		mov dword ptr[ecx + esi * 4], edx

		inc esi

		mov eax, dword ptr[ebp + 8]
		mov edx, dword ptr[ebp + 20]
		
		jmp cycle
	
	done:
	mov esi, 1
	all_divisible_cycle:
		cmp esi, ebx
		je all_divisible
		cmp dword ptr[ecx + esi], 0
		jne end_all_divisible
		inc esi
		jmp all_divisible_cycle

	end_all_divisible:
	all_non_divisible_cycle:
		cmp esi, ebx
		je all_non_divisible
		mov edx, dword ptr[ecx + esi * 4]
		cmp edx, 0
		je end_all_non_divisible
		inc esi
		jmp all_non_divisible_cycle

	all_divisible:
		mov eax, -1
		jmp actual_end

	all_non_divisible:
		mov eax, -2
		jmp actual_end

	end_all_non_divisible:
	; famo la somma
	mov esi, 0
	mov eax, 0
	sum_cycle:
		cmp esi, ebx
		je actual_end
		add eax, dword ptr[ecx + esi * 4]
		inc esi
		jmp sum_cycle

	actual_end:

	pop edi
	pop esi
	pop ebx
	mov esp, ebp
	pop ebp

	ret

_somma_modulo endp 

divide proc
	
	push ecx
	
	mov ecx, edx
	mov eax, dword ptr[eax + esi * 4]
	cdq
	idiv ecx
	
	pop ecx

	ret

divide endp

End