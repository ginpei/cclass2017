#include <stdio.h>

int sumInt(const int array[], const int length);
int multbytwo(int n);
int square(int n);
void printnchars(const char ch, const int n);

int main() {
	// #1
	printf("sumInt()\n");
	int array1[] = {1, 2, 3, 4, 5, 6};
	printf("%d\n", sumInt(array1, sizeof(array1) / sizeof(array1[0])));
	printf("\n");

	// #2
	printf("multbytwo()\n");
	const int length2 = 10;
	for (int i = 1; i <= length2; i++) {
		printf("%d -> %d\n", i, multbytwo(i));
	}
	printf("\n");

	// #3
	printf("square()\n");
	const int length3 = 10;
	for (int i = 1; i <= length3; i++) {
		printf("%d -> %d\n", i, square(i));
	}
	printf("\n");

	// #4
	printf("printnchars()\n");
	const int length4 = 5;
	for (int i = 1; i <= length4; i++) {
		printf("printnchars('x', %d)\n", i);
		printnchars('x', i);
	}
	printf("\n");

	return 0;
}

int sumInt(const int array[], const int length) {
	int sum = 0;
	for (int i = 0; i < length; i++) {
		sum += array[i];
	}
	return sum;
}

int multbytwo(int n) {
	return n * 2;
}

int square(int n) {
	return n * n;
}

void printnchars(const char ch, const int n) {
	for (int i = 0; i < n; i++) {
		printf("%c", ch);
	}
	printf("\n");
}
