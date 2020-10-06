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

		/*
			leggo gli elementi di posizione 0 e 4 del vettore e li sommo.
			tutto fatto tramite indirizzamento base + indice * scala
		*/

		mov ebx, p
		mov esi, 1

		sub byte ptr[ebx], 32;
		sub byte ptr[ebx + esi * 4], 32

	}

	printf("%s", vect);

}