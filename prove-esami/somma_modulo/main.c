#include <stdlib.h>
#include <stdio.h>

int somma_modulo(int* src, int lunghezza, int* dst, int divisore);

int main(){
      
    int src[10] = { 1, 2, 3, 4, 57, -1, -2, -3, -46, -55 };
    int dst[10];
    int ret;
    printf("Somma = %d", somma_modulo(src, 10, dst, -5));

}