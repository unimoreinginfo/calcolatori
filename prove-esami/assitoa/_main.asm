.586
.model flat
.code

trova_potenza_del_10 proc ; num

	push ebp
	mov ebp, esp

	push ebx
	push ecx
	push edx
	
	; ------------------------------------------------------- corpo della funzione

	mov ebx, dword ptr[ebp + 8] ; num
	mov ecx, 1                  ; potenza del 10

trova_potenza_del_10_ripeti:
	; moltiplico x10
	mov eax, 10
	mul ecx       ; risultato -> edx; eax
	mov ecx, eax

	; divio il numero per ecx
	mov eax, ebx
	mov edx, 0
	div ecx
	; risultato in eax

	cmp eax, 0
	jnz trova_potenza_del_10_ripeti

	mov eax, ecx
	mov edx, 0
	mov ebx, 10
	div ebx

	; -------------------------------------------------------
	
	pop edx
	pop ecx
	pop ebx
	pop ebp

	ret

trova_potenza_del_10 endp

_assitoa proc

	push ebp
	mov ebp, esp

	push ebx
	push ecx
	push edx
	push esi
	push edi
	
	; ------------------------------------------------------- corpo della funzione

	mov esi, dword ptr[ebp + 16] ; stringa
	mov ecx, dword ptr[ebp + 12] ; sgn
	mov edi, dword ptr[ebp + 8]  ; src

	; se il segno è 0 inizia con la computazione
	cmp ecx, 0
	jz inizia

; sgn = 1
	cmp edi, 0
	jns inizia

	mov byte ptr[esi], '-'
	inc esi

	; se è negativo fa il valore assoluto del numero prima di iniziare
	neg edi

inizia:
ripeti:

	push edi
	call trova_potenza_del_10
	pop edi

	mov ebx, eax ; ebx = potenza del 10
	mov eax, edi
	mov edx, 0
	div ebx

	mov ecx, eax ; ecx = digit

	mul ebx ; eax * potenza del 10 
	sub edi, eax

	add ecx, '0' ; in questo modo ora dentro eax ho il carattere
	
	; scrive la digit sulla stringa
	mov byte ptr[esi], cl 
	inc esi

	cmp edi, 0
	jnz ripeti
	
	mov byte ptr[esi], 0

	; recupero i parametri qui e faccio i check per ritornare il valore giusto in base al segno
	
	mov edi, dword ptr[ebp + 8]  ; src
	mov ecx, dword ptr[ebp + 12] ; sgn

	cmp ecx, 0
	jnz segno_presente_2

; segno_non_presente
	mov eax, 0
	jmp discard_and_ret

; 3)
segno_presente_2:
	cmp edi, 0
	js num_negativo
	jz num_zero

; num_positivo
	mov eax, 1
	jmp discard_and_ret

num_zero:
	mov eax, -2
	jmp discard_and_ret

num_negativo:
	mov eax, -1
	jmp discard_and_ret

; 2)
segno_invalido:
	mov eax, -2
	jmp discard_and_ret

discard_and_ret:

	; -------------------------------------------------------

	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	pop ebp

	ret

_assitoa endp

End
