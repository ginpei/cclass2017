#include <stdio.h>

#include "lib/getline2.h"

int reverse(char line[], int len);

int main() {
	const int max = 32;
	char line[max];
	while (1) {
		printf("Input lines > ");
		const int length = getline2(line, max);
		if (length == EOF) {
			printf("\n");
			break;
		}

		reverse(line, length);
	}
	return 0;
}

int reverse(char line[], int len) {
		for (char *p = line + len - 1; p >= line; p--) {
			printf("%c", *p);
		}
		printf("\n");

		return 0;
}
