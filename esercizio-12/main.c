#include <stdio.h>

__declspec(naked) int media(int *v, int lunghezza) {
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

		ciclo:
		cmp esi, ecx
		je dividi
		add eax, dword ptr [ebx+esi*4]
		inc esi
		jmp ciclo
		dividi:
		cdq
		div ecx

		pop ecx
		pop ebx
		pop esi
		mov esp, ebp
		pop ebp

		ret
	}
}

int main() {
	int v[10] = { 1,2,3,4,5,6,7,8,9,10 };
	printf("La media e' %d", media(v, 10));
}