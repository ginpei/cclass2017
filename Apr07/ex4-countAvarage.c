#include<stdio.h>
#include<stdlib.h>

#include "getline2.h"

int main() {
	const int max = 8;
	char line[max];

	float sum = 0.0;
	int count = 0;

	printf("Input some phrases less than %d letters. C-d to quit.\n", max);
	while (getline2(line, max) != EOF) {
		const int number = atoi(line);
		sum += number;
		count++;
	}

	float average = sum / count;
	printf("Average=%f\n", average);

	return 0;
}
