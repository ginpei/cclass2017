#include <stdio.h>

void countNumbersGreaterThanThree();
void computeAverages();
void printNumbersIndicatingEvenOrOdd(const int from, const int to);
void printFactorials(const int max);
void printFibonacci(const int max);
int calcFibonacci(const int number);

int main() {
	countNumbersGreaterThanThree();
	printf("----------------\n");
	computeAverages();
	printf("----------------\n");
	printNumbersIndicatingEvenOrOdd(1, 10);
	printf("----------------\n");
	printFactorials(10);
	printf("----------------\n");
	printFibonacci(10);
}

void countNumbersGreaterThanThree() {
	const int threshold = 3;
	const int max = 9;

	int count = 0;
	for (int i = 0; i <= max; i++) {
		if (i > threshold) {
			count += 1;
		}
	}

	printf("There are %d numbers greater than 3 between %d and %d.\n", count, 0, max);
}

void computeAverages() {
	const int array[] = {1, 4, 9, 16, 25, 36, 49, 64, 81, 100};
	const int length = 10;

	int sum = 0;
	for (int i = 0; i < length; i++) {
		sum += array[i];
	}

	float average = ((float) sum) / length;
	printf("The average is %f.\n", average);
}

void printNumbersIndicatingEvenOrOdd(const int from, const int to) {
	for (int i = from; i <= to; i++) {
		if (i % 2) {
			printf("%d is odd\n", i);
		}
		else {
			printf("%d is even\n", i);
		}
	}
}

void printFactorials(const int max) {
	for (int i = 1; i <= max; i++) {
		int result = 1;
		for (int j = 1; j <= i; j++) {
			result *= j;
		}
		printf("Factorial of %2d is %7d (0x%04X)\n", i, result, result);
	}
}

void printFibonacci(const int max) {
	for (int i = 0; i <= max; i++) {
		const int result = calcFibonacci(i);
		printf("Fibonacci number of %d is %d\n", i, result);
	}
}

int calcFibonacci(const int number) {
	if (number <= 0) {
		return 0;
	}
	else if (number == 1) {
		return 1;
	}
	else {
		return calcFibonacci(number - 2) + calcFibonacci(number - 1);
	}
}
