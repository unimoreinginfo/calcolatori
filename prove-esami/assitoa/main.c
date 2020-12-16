


#include <stdio.h>

// Funzione che converte il numero in input `src` a stringa e lo salva in `stringa`.
// Se `sgn` = 0 allora il segno viene ignorato, altrimenti viene salvato nella stringa.

int assitoa(int src, int sgn, char* stringa);

int main()
{
    char src[255];
    int ret;
    ret = assitoa(-56778, 1, src);
    printf("%s ha ritornato %d", src, ret);
}

