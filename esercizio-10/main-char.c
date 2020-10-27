#include <stdlib.h>
#include <stdio.h>

__declspec(naked) int sommavett(char* v, int len) {
		
	__asm {

		// dword ptr[ebp + 8] c'è il primo indirizzo
		// dword ptr[ebp + 12] c'è la lunghezza

		push ebp
		mov ebp, esp
		push edi
		push esi
		push ebx
		push ecx

		mov esi, 0 // 00000000 00000000 00000000 00000000 
		mov edi, 0  // 00000000 00000000 00000000 00000000 
		mov eax, 0 // 00000000 00000000 00000000 00000000 
		mov ecx, dword ptr[ebp + 8] // ci mettiamo il primo indirizzo
		mov ebx, dword ptr[ebp + 12] // la lunghezza del nostro vettore

		wh:

			cmp ebx, esi
			jz done
			add al, byte ptr[ecx + esi * 1]
			add edi, eax
			mov eax, 0
			inc esi

		jmp wh
		
		done:
			mov eax, edi
			pop ecx
			pop ebx
			pop esi
			pop edi
			mov esp, ebp
			pop ebp
			ret

	}

}

int main() {

	/*
		consegna:
			somma di tutti gli elementi del vettore di char tramite una funzione

		soluzione:
			la soluzione è molto simile alla precedente.
			l'unica difficoltà è quella di sommare char (a 8 bit) in un registro a 32-bit.
			per ovviare al problema si usano soltanto 8 bit di eax per prendere il valore del char (e ovviare al problema di dimensione),
			questo valore a 8 bit viene sommato in un registro a 32-bit, in modo tale da poter esprimere un numero più grande di un byte

	*/

	char vett[4] = { 'a', 'b', 'c', 'd' };

	printf("somma: %d", sommavett(vett, 4));

}