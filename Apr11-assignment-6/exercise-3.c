#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "lib/getline2.h"
#include "lib/getwords.h"

int main() {
	const int max = 128;
	char line[max];
	const int maxWords = 32;
	char *foundWords[maxWords] = { 0 };
	
	float balance = 0;
	
	while (1) {
		printf("Type deposit, check or exit > ");
		int len = getline2(line, max);
		if (len == EOF) {
			break;
		}

		int numWords = getwords(line, foundWords, maxWords);

		// finish if no operations are given
		if (numWords < 1) {
			continue;
		}

		char *operation = foundWords[0];

		if (strcmp(operation, "deposit") == 0) {
			if (numWords == 2) {
				balance += atof(foundWords[1]);
			}
			else {
				printf("Usage: deposit 1000\n");
			}
		}
		else if (strcmp(operation, "check") == 0) {
			if (numWords == 2) {
				balance -= atof(foundWords[1]);
			}
			else {
				printf("Usage: check 1000\n");
			}
		}
		else if (strcmp(operation, "exit") == 0) {
			break;
		}
	
		printf("Balance: %.2f\n", balance);
	}

	printf("\n");
	printf("Bye.\n");
	
	return 0;
}
