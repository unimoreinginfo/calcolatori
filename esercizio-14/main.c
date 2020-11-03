#include <stdio.h>

__declspec(naked) long long unsigned int fattoriale(unsigned int n) {
	__asm {
		// cdq
		push ebp
		mov ebp, esp
		push ebx
		push ecx

		cmp n, 0
		jne inizio

		mov eax, 1
		mov edx, 0
		jmp fine

		inizio:

		mov eax, n
		mov ebx, 2
		mov ecx, n


		ciclo:
		cmp ebx, ecx
		jnb fine
		mul ebx
		inc ebx
		jmp ciclo
		fine:

		pop ecx
		pop ebx
		mov esp, ebp
		pop ebp

		ret
	}
}

int main() {
	printf("Il fattoriale e' %llu", fattoriale(10));
}