#include <stdio.h>

int main(void) {
	char str[255] = "Ingegneria Informatica fa schifo ma si diventa ricchi";

	__asm {
	// rendere maiuscole le consonanti minuscole
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
	cmp bl, 'a'
	jl fineciclo
	sub bl, 20h
	mov [eax+esi], bl
	fineciclo:
	cmp bl,0
	je fine
	inc esi
	jmp ciclo


	fine:
	mov num, ecx
	}

	printf("stringa cambiata: %s", str);
	return 0;
}