#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "lib/getline2.h"

int main() {
	const int lineMax = 1024;
	char line[lineMax];
	int maxLines = 32;
	int numLines = 0;
	char **lines = malloc(sizeof(char *) * maxLines);

	printf("Input something and input EOF (C-d).\n");
	while (getline2(line, lineMax) != EOF) {
		// keep enough memory
		if (numLines + 1 > maxLines) {
			maxLines *= 2;
			lines = realloc(lines, sizeof(char *) * maxLines);
		}

		// store the line
		int lineLength = strlen(line);
		lines[numLines] = malloc(lineLength + 1);  // remember \0
		strcpy(lines[numLines], line);
		*(lines[numLines] + lineLength) = '\0';
		numLines++;
	}

	printf("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - \n");

	// output reversely, freeing memory
	for (int i = 0; i < numLines; i++) {
		char *line = lines[numLines - i - 1];
		printf("%s\n", line);
		free(line);
	}

	free(lines);

	return 0;
}
