#include <stdio.h>

#include "getline2.h"

int main() {
	const int max = 2;
	char line[max];
	printf("Input one letter each.\n");
	while (getline2(line, max) != EOF) {
		for (int i = 0; i < max && line[i] != '\0'; i++) {
			printf("%c = %d\n", line[i], line[i]);
		}
	}
	return 0;
}
