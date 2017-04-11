#include <stdio.h>

#include "getline2.h"

int reverse(char line[], int len);

int main() {
	const int max = 32;
	char line[max];
	while (1) {
		printf("Input lines > ");
		const int length = getline2(line, max);
		if (length == EOF) {
			break;
		}

		reverse(line, length);
	}
	return 0;
}

int reverse(char line[], int len) {
		for (int i = 0; i < len + 1; i++) {
			printf("%c", line[len - i]);
		}
		printf("\n");

		return 0;
}
