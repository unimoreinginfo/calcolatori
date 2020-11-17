.586
.model flat
.code

_primo proc

push EBP								; init
mov ebp, esp
push edi
push esi
push ebx

mov esi, dword ptr [ebp + 16]			; carica lunghezza
dec esi
mov edx, 0

mainLoop:								; Scorre vettore a
cmp esi, 0							
jl mainEnd
mov ebx, dword ptr [ebp + 8]			; Carica un elemento di a
mov ebx, dword ptr [ebx + esi * 4]
call verifica							; Check se è primo
mov ecx, dword ptr [ebp + 12]			; Carica il corrispondente di B
cmp ebx, 0								; Se è primo
je primerFound							; Mette 1 dentro a B
dec esi									; Scorre
jmp mainLoop							; Torna all'inizio

primerFound:						
mov dword ptr [ecx + esi * 4], 1
dec esi
inc edx
jmp mainLoop

mainEnd:
mov eax, edx
pop ebx
pop esi
pop edi
mov esp, ebp
pop ebp

_primo endp

verifica proc
push esi					; Salva i registri
push eax
push ecx
push edx

mov esi, 2					; Inizializza
mov ecx, 0

testLoop:					; Controlla se è primo
cmp ebx, esi				; Se il test è uguale al numero, fine
je testEnd				
mov eax, ebx				; Altrimenti mette in EAX il numero da testare
cdq							; Prepara la divisione
idiv esi					; Divide il numero da testare per l'intero corrente
cmp edx, 0					; Resto 0 = divisibile (Non può essere una divisione per se stesso)
je notPrimer				; Il numero non è primo, break
inc esi						; Prossimo intero
jmp testLoop				; Ricomincia

notPrimer:					; Il numero non è primo, mette a 1 il flag e finise
mov ecx, 1
jmp testEnd

testEnd:					; mette il flag nel registro ebx usato come return
mov ebx, ecx

pop edx						; Ripristina i registri
pop ecx
pop eax
pop esi
ret
verifica endp

end