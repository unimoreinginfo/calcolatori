.586
.model flat
.code

_conta_vocali_consonanti proc

PUSH EBP
MOV EBP, ESP
PUSH EDI
PUSH ESI
PUSH EBX

MOV EBX, dword ptr[EBP + 8]			;EBX - indirizzo vettore
MOV ESI, 0							;ESI - index
MOV ECX, 0							;ECX - numero vocali
MOV EDX, 0							;EDX - numero consonanti
MOV EDI, 1

conta:
	MOV AL, byte ptr[EBX + ESI]		;AL - char corrente
	CMP AL, 0
	JE fine_ciclo
	CMP AL, 64
	JA potrebbe_essere_maiusc
	;else: non e' una lettera
riprendi_ciclo:
	INC ESI
	JMP conta

potrebbe_essere_maiusc:
	CMP AL, 91
	JB maiuscola
	CMP AL, 96
	JA potrebbe_essere_min
	JMP riprendi_ciclo

maiuscola:
	CMP AL, 65
	JE incrementa_vocali
	CMP AL, 69
	JE incrementa_vocali
	CMP AL, 73
	JE incrementa_vocali
	CMP AL, 79
	JE incrementa_vocali
	CMP AL, 85
	JE incrementa_vocali
	JMP incrementa_consonanti

potrebbe_essere_min:
	CMP AL, 123
	JB minuscola
	JMP riprendi_ciclo

minuscola:
	MOV EDI, 0
	CMP AL, 97
	JE incrementa_vocali
	CMP AL, 101
	JE incrementa_vocali
	CMP AL, 105
	JE incrementa_vocali
	CMP AL, 111
	JE incrementa_vocali
	CMP AL, 117
	JE incrementa_vocali
	JMP incrementa_consonanti

incrementa_vocali:
	INC ECX
	JMP riprendi_ciclo

incrementa_consonanti:
	INC EDX
	JMP riprendi_ciclo

fine_ciclo:
	MOV EAX, 0
	MOV EBX, dword ptr[EBP + 12]		;valori di ritorno
	MOV [EBX], ECX
	MOV EBX, dword ptr[EBP + 16]
	MOV [EBX], EDX
	ADD ECX, EDX						;ECX - lettere contate
	CMP ECX, 0
	JE non_ci_sono_lettere
	CMP ECX, ESI
	JE ci_sono_solo_lettere
	JMP fine

non_ci_sono_lettere:
	MOV EAX, -1
	JMP fine

ci_sono_solo_lettere:
	CMP EDI, 0
	JE solo_lettere_con_min
	MOV EAX, -3
	JMP fine

solo_lettere_con_min:
	MOV EAX, -2
	JMP fine

fine:
POP EBX
POP ESI
POP EDI
MOV ESP, EBP
POP EBP
RET

_conta_vocali_consonanti endp

end