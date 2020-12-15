#include <stdlib.h>
#include <stdio.h>

int cerca_combinazioni_numero(char* src, int num, int* vettori_num);

int main(){
      
    char str[255] = "be1lla la1 11 vi111 111 111 111 la11 l1 l1 1 1 1 1";
    int vettori_num[3];
    int ret;
    ret = cerca_combinazioni_numero(str, 1, vettori_num);

    // non ci saranno mai quattro uno vicini

}