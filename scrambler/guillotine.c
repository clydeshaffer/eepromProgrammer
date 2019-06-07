#include <stdio.h>
#include <stdlib.h>

long start_addr_offset = 0x0A;
long bytes_to_copy = 8192;

int main(int argc, char** argv) {

	if(argc == 0) {
		return 0;
	}
	
	if(argc < 3) {
		printf("usage: %s infile outfile\n", argv[0]);
		return 0;
	}

	FILE *orig = fopen(argv[1], "rb");
	fseek(orig, start_addr_offset, SEEK_SET);
	long pixels_offset = 0;
	fread(&pixels_offset, sizeof(long), 1, orig);
	printf("offset is %ld bytes\n", pixels_offset);
	fseek(orig, pixels_offset, SEEK_SET);

	FILE *headlessFile = fopen(argv[2], "wb");
	char c = fgetc(orig);
	long i;
	for(i = 0; (i < bytes_to_copy) && (!feof(orig)); i++) {
		fputc(c, headlessFile);
		c = fgetc(orig);
	}
	printf("wrote %ld bytes.\n", i);
	return 0;
}