#include <stdio.h>

int main(void) {
	char str[255] = "Ingegneria Informatica fa schifo ma si diventa ricchi";

	char *p = str;

	__asm {
	// rendere maiuscole le consonanti minuscole
	mov esi, 0
	mov eax, p

	ciclo:
	mov bl, byte ptr [eax+esi]
	cmp bl, 'a'
	jng fineciclo
	cmp bl, 'z'
	jg fineciclo
	cmp bl, 'e'
	je fineciclo
	cmp bl, 'i'
	je fineciclo
	cmp bl, 'o'
	je fineciclo
	cmp bl, 'u'
	je fineciclo
	sub bl, 20h
	mov [eax+esi], bl
	fineciclo:
	cmp bl,0
	je fine
	inc esi
	jmp ciclo


	fine:
	}

	printf("stringa cambiata: %s", str);
	return 0;
}