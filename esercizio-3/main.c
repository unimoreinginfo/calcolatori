#include <stdlib.h>
#include <stdio.h>
int main() {

	unsigned int a = 5, b = 7, c;


	/*
		consegna: moltiplicazione fra a e b
	*/

	__asm {

		mov eax, a
		mov ebx, b
		mov ecx, 0

		start:
			cmp ebx, 0
			je end 
			add ecx, a
			sub ebx, 1
			jmp start

		end: 
			mov c, ecx

	}

	printf("Il prodotto tra %d e %d e' %d", a, b, c);

}