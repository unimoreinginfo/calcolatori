#include <stdlib.h>
#include <stdio.h>

__declspec(naked) int converti_maiuscolo(char* str) {
		
	__asm {

		// dword ptr[ebp + 8] c'è il primo indirizzo

		push ebp
		mov ebp, esp
		push edi
		push esi
		push ebx
		push ecx

		mov eax, 0
		mov esi, 0 // 00000000 00000000 00000000 00000000 
		mov eax, dword ptr[ebp + 8] // ci mettiamo il primo indirizzo

		wh:

			cmp byte ptr[eax + esi * 1], 0
			jz done
			cmp byte ptr[eax + esi * 1], 32
			jz end_cycle
			sub byte ptr[eax + esi * 1], 32
			end_cycle: inc esi

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
			data la stringa fare tutto in maiuscolo

		soluzione:
			scorro il vettore e diminuisco di 32 in caso non sia uno spazio

	*/

	char str[] = "ciao ";
	converti_maiuscolo(str);
	printf("stringa: %s", str);

}