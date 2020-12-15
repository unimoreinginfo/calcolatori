.586      
.model flat     
.code   	

_cerca_combinazioni_numero proc
	
	push ebp
	mov ebp,esp
	push ebx
	push esi
	push edi
	
	mov eax, 0
	mov ecx, 0
	mov ebx, dword ptr[ebp + 8] ; stringa nella quale cercare il numero
	mov ecx, dword ptr[ebp + 12] ; il numero (è in cl poiché va da 0 a 9)
	mov edx, dword ptr[ebp + 16] ; vettori_num

	mov dword ptr[edx + 0], 0
	mov dword ptr[edx + 4], 0
	mov dword ptr[edx + 8], 0 ; inizializzo vettori_num

	mov esi, 0

	cycle:
		cmp byte ptr[ebx + esi], 0 
		je single_end
		call do_the_thing
		cmp eax, 1
		je inc_1
		cmp eax, 2
		je inc_2
		cmp eax, 3
		je inc_3
		jmp hop
		; ritorna 1, 2, 3 in base a quanti ne ha trovati di fila
		; ritorna 4 se non è valido
		
	hop:
		inc esi
		jmp cycle
	inc_1: 
		inc dword ptr[edx + 0]
		jmp cycle
	inc_2: 
		inc dword ptr[edx + 4]
		jmp cycle
	inc_3: 
		inc dword ptr[edx + 8]
		jmp cycle

	single_end:
		mov esi, 0

	pop edi
	pop esi
	pop ebx
	mov esp, ebp
	pop ebp

	ret

_cerca_combinazioni_numero endp 

do_the_thing proc

	mov ch, byte ptr[ebx + esi]; carattere in ch, carattere da comparare in cl
	sub ch, '0' ; lo trasformo in numero

	; controllo di singola occorrenza
	cmp ch, cl
	je found_one_occ
	jmp not_really

	found_one_occ:
	mov eax, 1 ; metto a 1, così in caso sia finita qui dico che ritorno un'occorrenza trovata
	inc esi
	mov ch, byte ptr[ebx + esi];

	cmp ch, 0 ; controllo se la stringa è finita, non si sa mai
	je done

	sub ch, '0'
	cmp ch, cl ; controllo se c'è un'altra occorrenza
	jne done ; abbiamo finito, non ci sono altre occorrenze
	jmp found_two_occ

	found_two_occ:
	mov eax, 2
	inc esi

	mov ch, byte ptr[ebx + esi];

	cmp ch, 0 ; controllo se la stringa è finita, non si sa mai
	je done

	sub ch, '0'
	cmp ch, cl ; controllo se c'è un'altra occorrenza
	jne done ; abbiamo finito, non ci sono altre occorrenze
	jmp found_three_occ

	found_three_occ:
	mov eax, 3
	inc esi

	mov ch, byte ptr[ebx + esi];

	cmp ch, 0 ; controllo se la stringa è finita, non si sa mai
	je done

	sub ch, '0'
	cmp ch, cl ; controllo se c'è un'altra occorrenza
	jne done ; abbiamo finito, non ci sono altre occorrenze
	jmp not_really

	not_really: mov eax, 4
	done:
		ret

do_the_thing endp

End