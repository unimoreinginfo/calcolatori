.586
.model flat
.code


_elimina_doppie proc

	push ebp
	mov ebp, esp
	push ebx
	push esi
	push edi
	
	mov eax, dword ptr[ebp + 8] ; stringa
	mov ebx, dword ptr[ebp + 12] ; char da trovare
	mov ecx, 0 ; coppie trovate
	mov edx, 0 ; carattere corrente
	mov esi, 0

	; La funzione deve cercare nella stringa str quante volte “lettera” compare come doppia nella stringa str. 
	; Le coppie (esatte ovvero non triple, quadruple ecc…) “lettera” in str devono quindi essere sovrascritte da due spazi. 
	; La funzione ritorna il numero di coppie esatte di “lettera” in str.

	cycle: 
		cmp byte ptr[eax + esi * 1], 0 ; stringa terminata?
		je ended
		call check_doppia

		jmp cycle

	ended:
		; finito il ciclo
	mov eax, ecx


	pop edi
	pop esi
	pop ebx
	mov esp, ebp
	pop ebp
	ret

_elimina_doppie endp

check_doppia proc
	
	cmp byte ptr[eax + esi], bl ; sono uguali?
	je yessa
	jmp nope_proprio
	
	yessa:
		inc esi
		cmp byte ptr[eax + esi], bl ; sono uguali?
		je yessa2
		jmp nope

	yessa2:
		inc esi
		cmp byte ptr[eax + esi], bl ; sono uguali?
		je skip_until
		inc ecx
		dec esi
		dec esi
		mov byte ptr[eax + esi], ' '
		inc esi
		mov byte ptr[eax + esi], ' '
		jmp done

	nope_proprio:
		inc esi
		jmp done

	skip_until: ; skippo finché non trovo un carattere diverso
		cmp byte ptr[eax + esi], bl ; sono uguali?
		jne done
		inc esi
		jmp skip_until
		jmp done
	nope:
	done:

	ret

check_doppia endp

End