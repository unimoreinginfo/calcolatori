#include <stdlib.h>
#include <stdio.h>

int primo(int* a, int* b, int lunghezza);

int main(void)
{
	int a[10] = { 11, 12, 3, 4, 5, 6, 7, 8, 9, 10 };
	int b[10] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

	int c = primo(a, b, 10);

	return 0;
}