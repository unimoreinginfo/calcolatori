#include <stdlib.h>
#include <stdio.h>

int main() {

	char str[255] = "ooga booga aaaa    fongle gongle bongle fonglerino asdknasui asdlòs??? ";
	char* p;
	p = &str[0];

	int parole = 0;

	/*
		consegna:
		contare il numero di parole

		è considerabile parola qualsiasi sequenza di caratteri separata da uno spazio (o da più)
		__parola__ è una parola
		parola__ è una parola
		parola? è una parola
		etc etc

		soluzione:
			quello che facciamo è controllare un carattere e confrontarlo col carattere dopo,
			se soddisfa il vincolo "il carattere corrente è diverso dallo spazio e il carattere successivo è uno spazio o il terminatore",
			allora il carattere corrente indica la fine di una parola, quindi si incrementa il contatore.

			vengono usati le parti alta e bassa del registro c per poter immagazzinare i dati riguardanti il vincolo


	*/

	__asm {

		mov eax, parole
		mov ebx, p
		mov ecx, 32; carattere precedente
		mov cl, 0; indica se è spazio
		mov ch, 0; indica se è lettera

		mov esi, 0

		; byte ptr[eax + esi * 1]

		count:
		cmp byte ptr[ebx + esi * 1], 0
			jz end

			jmp check_if_word
			checked :
		inc esi
			jmp count

			check_if_word :
		cmp byte ptr[ebx + esi * 1], 32; lettera corrente
			jnz is_letter
			jmp end_check
			back : cmp byte ptr[ebx + (esi + 1) * 1], 32; eventuale spazio dopo lettera
			jz is_space
			cmp byte ptr[ebx + (esi + 1) * 1], '\0'
			jz is_space
			jmp end_check
			back2 : cmp cl, ch
			jz is_word

			is_letter :
		mov ch, 1
			jmp back
			is_space :
		mov cl, 1
			jmp back2
			is_word :
		inc eax
			jmp end_check

			end_check : jmp checked

			end :
		mov parole, eax

	}

	printf("%d parola/e", parole);

}