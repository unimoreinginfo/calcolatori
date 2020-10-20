#include <stdio.h>

int main(void) {
	char str[255] = "Ingegneria Informatica fa schifo ma si diventa ricchi";
	int num = 0;

	char *p = str;

	__asm {
	// contare quante consonanti ci sono nella stringa
	mov eax, p
	mov ecx, 0
	mov esi, 0

	ciclo:
	mov bl, byte ptr [eax+esi]
	cmp bl, 'A'
	jl fineciclo
	cmp bl, 'z'
	jg fineciclo
	cmp bl, 'Z'
	jng confronti
	cmp bl, 'a'
	jl fineciclo
	confronti:
	cmp bl, 'a'
	je fineciclo
	cmp bl, 'A'
	je fineciclo
	cmp bl, 'e'
	je fineciclo
	cmp bl, 'E'
	je fineciclo
	cmp bl, 'i'
	je fineciclo
	cmp bl, 'I'
	je fineciclo
	cmp bl, 'o'
	je fineciclo
	cmp bl, 'O'
	je fineciclo
	cmp bl, 'u'
	je fineciclo
	cmp bl, 'U'
	je fineciclo
	inc ecx
	fineciclo:
	cmp bl,0
	je fine
	inc esi
	jmp ciclo


	fine:
	mov num, ecx
	}

	printf("le consonanti sono %d", num);
	return 0;
}