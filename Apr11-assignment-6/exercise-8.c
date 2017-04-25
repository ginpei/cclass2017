#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/**
 * Read line from stdin.
 * You have to free the returned value.
 */
char *getLine() {
	int size = 32;
	int position = 0;
	char *buffer = malloc(sizeof(char) * size);

	int c;
	while ((c = getchar()) != '\n') {
		if (position + 2 > size) {  // next char and \0
			size *= 2;
			buffer = realloc(buffer, size);
		}

		buffer[position] = c;
		position += 1;
	}

	buffer[position] = '\n';

	return buffer;
}

int main() {
	printf("Input a long line, as well as you feel comfortable.\n");
	char *line = getLine();
	printf("The line is %d charactors.\n", strlen(line));
	free(line);
	return 0;
}
