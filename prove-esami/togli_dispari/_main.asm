.586      
.model flat     
.code   	

_togli_dispari proc
	
	push ebp
	mov ebp,esp
	push ebx
	push esi
	push edi
	
	mov eax, 0
	mov edx, 0
	mov ecx, dword ptr[ebp + 8] ; vettore char
	mov ebx, dword ptr[ebp + 12] ; lunghezza
	dec ebx ; l'ultimo elemento sarà sempre pari

	mov esi, 1 ; indice (il primo elemento sarà sempre pari)
	mov edi, 0 ; numero di elementi modificati

	; sostituire nel vettore char gli elementi dispari SOLO SE gli elementi attorno a src[i] sono PARI
	; la sostituzione è fatta facendo la media degli elementi attorno a src[i] (+ 1 se la media è dispari)
	; se in src i numeri sono tutti dispari non modificarlo e ritornare -1
	; se i numeri sono tutti pari non modificarlo e ritornare 2
	; se il numero di elementi modificati è pari e diverso da 0 il valore di ritorno sarà il numero degli elementi modificati

	call check_if_all_even
	cmp eax, 1
	je all_even
	call check_if_all_odd
	cmp eax, 1
	je all_odd

	mov esi, 1

	cycle:
		cmp esi, ebx
		je done
		
		call is_even
		cmp eax, 1 ; è pari?
		je yeah
		
		dec esi ; guardo se l'elemento prima di i è pari
		call is_even
		cmp eax, 1
		jne nah
		inc esi 
		inc esi ; guardo se l'elemento dopo i è pari
		call is_even
		cmp eax, 1
		jne nah_dec

		; tutti i test sono stati superati, gli elementi i + 1 e i - 1 sono pari
		mov eax, 0 ; resettiamo eax
		mov edx, 0
		mov al, byte ptr[ecx + esi] ; elemento davanti a i
		cbw
		dec esi
		dec esi
		mov dl, byte ptr[ecx + esi] ; elemento dietro a i
		inc esi ; mi riposiziono a i
		
		add ax, dx ; faccio la media 
		mov edx, 0
		mov dl, 2
		cbw
		div dl
		mov byte ptr[ecx + esi], 0
		mov byte ptr[ecx + esi], al ; mettiamo qui il risultato della media
		inc edi ; elemento modificato!
		call is_even ; vediamo se è dispari
		cmp eax, 0
		jne hop
		inc byte ptr[ecx + esi] ; se è dispari lo incrementiamo di uno

		yeah: 
		jmp hop
		nah:
		inc esi
		jmp hop
		nah_dec:
		dec esi

		hop:
		inc esi

		jmp cycle

	all_even:
		mov eax, -2
		jmp done_fr

	all_odd:
		mov eax, -1
		jmp done_fr

	done:
		; guardiamo se edi è pari (edi contiene il numero di elementi modificati)
		; mi son ricordato che si può fare anche con l'and
        ; USATE STO MODO, E' MOLTO MEGLIO EFFETTIVAMENTE, NON STATE A FARE COME HO FATTO IO IN is_even (non dividete per due il numero, è molto più lento, basta fare l'and lololol)
		mov edx, edi
		and edi, 1b ; bit mask, guardo se l'ultimo bit è 1: in tal caso è dispari
		jnz done_fr 

		mov eax, edx

	done_fr:


	pop edi
	pop esi
	pop ebx
	mov esp, ebp
	pop ebp

	ret

_togli_dispari endp 

is_even proc
	
	mov eax, 0
	mov edx, 0

	mov dl, 2
	mov ax, word ptr[ecx + esi]
	cbw
	div dl
	cmp ah, 0
	je yeah_it_is
	jmp no_it_isnt

	yeah_it_is:
	mov eax, 1
	jmp hop

	no_it_isnt:
	mov eax, 0

	hop:

	ret

is_even endp

check_if_all_odd proc
	
	odd_cycle:
	cmp ebx, esi
	je finished

		call is_even
		cmp eax, 0
		jne nope_odd

	inc esi
	jmp odd_cycle

	nope_odd:
	mov eax, 0
	jmp hopperino

	finished:
	mov eax, 1

	hopperino:
	ret

check_if_all_odd endp

check_if_all_even proc
	
	even_cycle:
	cmp ebx, esi
	je finished

		call is_even
		cmp eax, 1
		jne nope

	inc esi
	jmp even_cycle

	nope:
	mov eax, 0
	jmp hoppity

	finished:
	mov eax, 1

	hoppity:
	ret

check_if_all_even endp

End