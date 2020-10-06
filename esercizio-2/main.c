#include <stdlib.h>
#include <stdio.h>

int main() {

	char vect[6] = "tonno";
	char* p;
	p = &vect[0];

	/*
		consegna: rendere maiuscola la prima e l'ultima lettera della parola,
	*/

	__asm {

		mov ebx, p
		mov esi, 4

		sub byte ptr[ebx], 32;
		sub byte ptr[ebx + esi * 1], 32

	}

	printf("%s", vect);

}
