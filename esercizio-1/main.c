#include <stdlib.h>
#include <stdio.h>

int main() {
	
	int *p;
	int somma = 0;
	int vect[5] = { 1, 2, 3, 4, 5 };

	p = &vect[0]; // p corrisponde all'indirizzo del primo elemento del vettore
	
	/*
		consegna: leggere il valore all'indice 0 e il valore all'indice 5
	*/

	__asm {

		/*
			leggo gli elementi di posizione 0 e 4 del vettore e li sommo.
			tutto fatto tramite indirizzamento base + indice * scala
		*/
		
		mov ebx, p
		mov esi, 4
		
		mov ecx, dword ptr[ebx];
		add ecx, dword ptr[ebx + esi * 4]

		mov somma, ecx

	}

	printf("%d", somma);

}
