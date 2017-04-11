#include <stdio.h>

#include "getline2.h"

int main() {
	int max = 8;
	char line[max];

	printf("Input some phrases less than %d letters. C-d to quit.\n", max);
	while (getline2(line, max) != EOF) {
		printf("You typed: %s\n", line);
	}

	return 0;
}
