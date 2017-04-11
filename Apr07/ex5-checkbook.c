#include<stdio.h>
#include<string.h>
#include<stdlib.h>

#include "getline2.h"

int main() {
	const int max = 8;
	char line[max];

	float balance = 0;

	while (1) {
		printf("Type deposit, check or exit > ");
		getline2(line, max);
		if (strcmp(line, "deposit") == 0) {
			printf("How much? > ");
			getline2(line, max);
			balance += atof(line);
		}
		else if (strcmp(line, "check") == 0) {
			printf("How much? > ");
			getline2(line, max);
			balance -= atof(line);
		}
		else if (strcmp(line, "exit") == 0) {
			printf("Bye.\n");
			break;
		}

		printf("Balance: %.2f\n", balance);
	}

	return 0;
}
