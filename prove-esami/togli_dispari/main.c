#include <stdlib.h>
#include <stdio.h>

int togli_dispari(unsigned char* src, int lunghezza);
int main(){
      
    unsigned char a[6] = { 2, 3, 4, 4, 5, 8 };
    
    int ret = togli_dispari(a, 6);

    printf("%d", ret);
    return 0;

}