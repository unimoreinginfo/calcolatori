#include <stdio.h>

int conta_vocali_consonanti(unsigned char* src, int* dstV, int* dstC);

int main() {
	char src[255] = "EECCSs1AA";
	int dstV, dstC;
	int ret = conta_vocali_consonanti(src, &dstV, &dstC);
	printf("%d, %d, %d\n", ret, dstV, dstC);
	return 0;
}