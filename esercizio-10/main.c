#include <stdlib.h>
#include <stdio.h>

__declspec(naked) int sommavett(int* v, int len) {
		
	__asm {

		// dword ptr[ebp + 8] c'è il primo indirizzo
		// dword ptr[ebp + 12] c'è la lunghezza

		push ebp
		mov ebp, esp
		push edi
		push esi
		push ebx
		push ecx

		mov esi, 0
		mov eax, 0
		mov ecx, dword ptr[ebp + 8] // ci mettiamo il primo indirizzo
		mov ebx, dword ptr[ebp + 12] // la lunghezza del nostro vettore

		wh:

			cmp ebx, esi
			jz done
			add eax, dword ptr[ecx + esi * 4]
			inc esi

		jmp wh
		
		done:
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
			somma di tutti gli elementi del vettore tramite una funzione

		soluzione:
			si mette in ecx l'indirizzo del primo elemento del vettore, in ebx la sua lunghezza
			tramite il "classico" while dell'assmebly si fa il resto, la vera differenza è che lo si sta facendo
			in una funzione, pertanto vanno pushati e poppati i valori dallo stack rispettivamente all'inizio e alla fine
			dell'esecuzione della funzione
			n.b: poiché il risultato va a finire in eax (per convenzione), non c'è bisogno né di pushare né di poppare questo registro


	*/

	int vett[10] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };

	printf("somma: %d", sommavett(vett, 10));

}