#include <stdio.h>
#include <stdlib.h>
//#include <file.h>

int bitOrder[13] = {1, 0, 10, 11, 9, 6, 7, 8, 3, 2, 4, 5, 12};

int scrambleNum(int raw) {
	int scrambled = 0;
	for(int i = 0; i < 13; i++) {
		if(raw & (1 << i)) {
			scrambled |= 1 << bitOrder[i];
		}
	}
	return scrambled;
}

int main(int argc, char** argv) {

	if(argc < 3) {
		return 0;
	}
	
	int count = 0;

	FILE *orig = fopen(argv[1], "rb");
	char inBuf[8192];
	for(int i = 0; i < 8192; i++) {
		inBuf[i] = fgetc(orig);
	}
	fclose(orig);

	char outBuf[8192];
	for(int i = 0; i < 8192; i++) {
		int iScram = scrambleNum(i);
		outBuf[i] = inBuf[iScram];
	}

	FILE *scrambledFile = fopen(argv[2], "wb");
	for(int i = 0; i < 8192; i++) {
		fputc(outBuf[i], scrambledFile);
	}

	fclose(scrambledFile);

	return 0;
}