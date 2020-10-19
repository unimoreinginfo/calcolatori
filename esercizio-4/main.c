#include <stdlib.h>
#include <stdio.h>

int main() {

	int a = -5, b = 7, c;


	/*
		consegna: moltiplicazione fra a e b (signed)
	*/

	__asm {

		mov eax, a
		mov ebx, b
		mov ecx, 0
		mov edx, 0

		cmp eax, 0
		jl negate_a
		comeback_a:
		cmp ebx, 0
		jl negate_b
		comeback_b:


		start:
			cmp ebx, 0
			je end 
			add edx, eax
			sub ebx, 1
			jmp start

		negate_a:
			neg eax
			inc ecx
			jmp comeback_a
		negate_b :
			neg ebx
			inc ecx
			jmp comeback_b
		negate_one_more_time:
			neg edx
			jmp come_here

		end: 
			cmp ecx, 1
			je negate_one_more_time
			come_here:
			mov c, edx


	}

	printf("Il prodotto tra %d e %d e' %d", a, b, c);

}
