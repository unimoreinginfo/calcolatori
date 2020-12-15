#include <stdlib.h>
#include <stdio.h>

int divisione_array(int* src, int divisore, int lunghezza, int* resto);
int main(){
      
    int a[3] = { 29, 5, 5 };
    int b[3] = { 0, 0, 0 };
    
    int c = divisione_array(a, 3, 3, b);

    printf("%d", c);
    return 0;

}