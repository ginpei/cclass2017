#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "lib/getline2.h"

int main() {
	const int lineMax = 1024;
	char line[lineMax];
	int bufferLength = 8;
	int bufferPosition = 0;
	char *buffer = malloc(bufferLength);

	printf("Input something.\n");
	while (getline2(line, lineMax) != EOF) {
		int lineLength = strlen(line) + 1;  // remember \n
		while (bufferPosition + lineLength > bufferLength) {
			bufferLength *= 2;
			buffer = realloc(buffer, bufferLength + 1);  // remember \0
			printf("required %d, reallocated %d\n", bufferPosition + lineLength, bufferLength);
		}

		strcpy(buffer + bufferPosition, line);
		*(buffer + bufferPosition + lineLength) = '\n';
		bufferPosition += lineLength + 1;  // remember \n
		printf("position %d\n", bufferPosition);
	}

	printf("position %d, allocated %d\n", bufferPosition, bufferLength);
	printf("%s\n", buffer);

	free(buffer);

	return 0;
}
