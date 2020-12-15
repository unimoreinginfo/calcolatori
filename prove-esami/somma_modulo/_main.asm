.586
.model flat
.code

_somma_modulo proc

PUSH EBP
MOV EBP, ESP
PUSH EDI
PUSH ESI
PUSH EBX

MOV EBX, dword ptr[EBP + 8]		;EBX <- puntatore di src
MOV ESI, dword ptr[EBP + 12]	;ESI <- lunghezza src e dst
MOV EDI, 0						;EDI <- index
MOV EAX, 0						;EAX <- elemento corrente del vettore src
MOV ECX, dword ptr[EBP + 20]	;ECX <- divisore
MOV EDX, 0

ciclo:
	MOV EAX, [EBX + EDI * 4]
	CDQ
	IDIV ECX					;divido EAX per ECX

	PUSH ECX
	MOV ECX, dword ptr[EBP + 16]
	MOV [ECX + EDI * 4], EDX
	POP ECX

	INC EDI
	CMP EDI, ESI
	JNE ciclo

MOV EDI, 0
MOV EAX, 0
MOV ECX, dword ptr[EBP + 16]

somma:
	MOV EBX, [ECX + EDI * 4]
	ADD EAX, EBX
	INC EDI
	CMP EDI, ESI
	JNE somma

POP EBX
POP ESI
POP EDI
MOV ESP, EBP
POP EBP
RET

_somma_modulo endp

end