#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "lib/getline2.h"

int main() {
	int max = 128;
	char line1[max];
	char line2[max];
	char *lineCat;

	printf("Input two phrases so that you'll see them concatenated.\n");
	printf("1> ");
	getline2(line1, max);
	printf("2> ");
	getline2(line2, max);

	lineCat = malloc(strlen(line1) + strlen(line2) + 1);

	strcpy(lineCat, line1);
	strcat(lineCat, line2);

	printf("Result: %s\n", lineCat);

	free(lineCat);

	return 0;
}
