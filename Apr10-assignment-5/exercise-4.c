#include <stdio.h>
#include <string.h>
#include "getline2.h"

int main() {
	int max = 128;
	char line1[max];
	char line2[max];
	char lineCat[max * 2];

	printf("Input two phrases so that you'll see them concatenated.\n");
	printf("1> ");
	getline2(line1, max);
	printf("2> ");
	getline2(line2, max);

	strcpy(lineCat, line1);
	strcat(lineCat, line2);

	printf("Result: %s\n", lineCat);

	return 0;
}
