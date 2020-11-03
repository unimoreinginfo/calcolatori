#include <stdio.h>

__declspec(naked) int atoi(char *str) {
	__asm {
		push ebp
		mov ebp, esp
		push esi
		push ebx
		push edi

		mov ebx, str
		mov eax, 0
		mov ecx, 0 // len
		mov edx, 0
		mov esi, 0
		mov edi, 1 // fattore moltiplicazione, in realtà usiamo solo di

		// troviamo la lunghezza
		ciclolen:
		mov dl, byte ptr [ebx+esi]
		cmp dl, 0
		je fineciclolen
		inc esi
		jmp ciclolen
		fineciclolen:

		dec esi
		push 0
		
		ciclo:
		cmp esi, 0
		jl fineciclo
		mov al, byte ptr [ebx+esi]
		sub al, '0'
		mul di
		pop edx
		add dx, ax
		push edx
		mov ax, di
		mov ecx, 10
		mul cl
		mov di, ax
		dec esi
		jmp ciclo
		fineciclo:
		pop eax
		

		pop edi
		pop ebx
		pop esi
		mov esp, ebp
		pop ebp

		ret

	}
}

int main() {
	char v[255] = "123";
	printf("Il numero e' %d", atoi(v));
}