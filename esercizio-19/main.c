#include <stdlib.h>
#include <stdio.h>

int conta_occorrenze(char* str, char* parola);
int main(){

    char str2[256] = "w la cacca per la cacca noi siamo automobili";
    char parola[256] = "automobili";

    printf("il numero di occorrenze e' %d", conta_occorrenze(str2, parola));

}