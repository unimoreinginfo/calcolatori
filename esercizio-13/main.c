#include <stdio.h>

__declspec(naked) int pari(int *v, int lunghezza) {
	__asm {
		// cdq
		push ebp
		mov ebp, esp
		push esi
		push ebx
		push ecx

		mov ebx, v
		mov ecx, lunghezza
		mov eax, 0
		mov esi, 0
		mov edx, 0

		ciclo:
		cmp esi, ecx
		je fine
		mov eax, dword ptr [ebx+esi*4]
		and eax, 1
		cmp eax, 1
		je fineciclo
		inc edx
		fineciclo:
		inc esi
		jmp ciclo
		fine:
		mov eax, edx


		pop ecx
		pop ebx
		pop esi
		mov esp, ebp
		pop ebp

		ret
	}
}

int main() {
	int v[10] = { 12,2,3,4,5,6,7,8,9,10 };
	printf("Ci sono %d numeri pari", pari(v, 10));
}