#include <stdio.h>

int main(void) {
	char str[255] = "Ingegneria Informatica fa schifo ma si diventa ricchi";
	int num = 0;

	char *p = str;

	__asm {
	// contare quante vocali ci sono nella stringa
	mov eax, p
	mov ecx, 0
	mov esi, 0

	ciclo:
	mov bl, byte ptr [eax+esi]

	cmp bl, 'a'
	je incrementa
	cmp bl, 'A'
	je incrementa
	cmp bl, 'e'
	je incrementa
	cmp bl, 'E'
	je incrementa
	cmp bl, 'o'
	je incrementa
	cmp bl, 'O'
	je incrementa
	cmp bl, 'u'
	je incrementa
	cmp bl, 'U'
	je incrementa
	fineciclo:
	cmp bl,0
	je fine
	inc esi
	jmp ciclo

	incrementa:
	add ecx, 1
	jmp fineciclo

	fine:
	mov num, ecx
	}

	printf("le vocali sono %d", num);
	return 0;
}