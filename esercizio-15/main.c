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
		mov edi, 1 

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
		mov eax, 0
		mov al, byte ptr [ebx+esi]
		sub eax, '0'
		mul edi
		pop edx
		add edx, eax
		push edx
		mov ax, di
		mov ecx, 10
		mul ecx
		mov edi, eax
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
	char v[255] = "25999";
	printf("Il numero e' %d", atoi(v));
}