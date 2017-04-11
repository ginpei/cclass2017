#include <stdio.h>

#include "getline2.h"

int main() {
	char line[MAXLINE];

	printf("Input some phrases less than %d letters. C-d to quit.\n", MAXLINE);
	while (getline2(line, MAXLINE) != EOF) {
		printf("You typed: %s\n", line);
	}

	return 0;
}
