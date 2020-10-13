#include <stdlib.h>
#include <stdio.h>

int main() {

	int a[3] = { 1, -2, 3 }, b[3] = { 1, 6, 3 }, c[3] = { 0, 0, 0 };
	int* p1, p2, p3;
	p1 = &a[0];
	p2 = &b[0];
	p3 = &c[0];

	/*
		consegna: 
		leggere i vettori con la modalità vista la scorsa volta (base e indice)

		confrontare gli elementi di a e b:
			- se a[i] >= b[i] -> c[i] = 1
	*/

	__asm {

		mov eax, p1
		mov ebx, p2
		mov ecx, p3
		mov edx, 0; lo usiamo per i valori del vettore a

		mov esi, 0

		start:
			mov edx, dword ptr[eax + esi * 4]
			cmp edx, dword ptr[ebx + esi * 4]
			jge sc
		go_back:
			inc esi
			cmp esi, 3
			jg end
			jmp start

		sc:
			inc dword ptr[ecx + esi * 4]
			jmp go_back

		end:


	}

	for (unsigned int i = 0; i < 3; i++) {
		printf("c[%d] = %d\n", i, c[i]);
	}
	
}