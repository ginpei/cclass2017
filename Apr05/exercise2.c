#include <stdio.h>

int functional(const int n);
int fibonacci(const int n);
int bunnyEars(const int n);
int powerN(const int base, const int exponent);
int sumDigits(const int n);

int main() {
	printf("functional(%d)->%d\n", 1, functional(1));
	printf("functional(%d)->%d\n", 2, functional(2));
	printf("functional(%d)->%d\n", 3, functional(3));
	printf("functional(%d)->%d\n", 4, functional(4));
	printf("functional(%d)->%d\n", 5, functional(5));
	printf("\n");
	printf("fibonacci(%d)->%d\n", 1, fibonacci(1));
	printf("fibonacci(%d)->%d\n", 2, fibonacci(2));
	printf("fibonacci(%d)->%d\n", 3, fibonacci(3));
	printf("\n");
	printf("bunnyEars(%d)->%d\n", 0, bunnyEars(0));
	printf("bunnyEars(%d)->%d\n", 1, bunnyEars(1));
	printf("bunnyEars(%d)->%d\n", 2, bunnyEars(2));
	printf("bunnyEars(%d)->%d\n", 3, bunnyEars(3));
	printf("\n");
	printf("powerN(%d, %d)->%d\n", 3, 1, powerN(3, 1));
	printf("powerN(%d, %d)->%d\n", 3, 2, powerN(3, 2));
	printf("powerN(%d, %d)->%d\n", 3, 3, powerN(3, 3));
	printf("\n");
	printf("sumDigits(%d)->%d\n", 126, sumDigits(126));
	printf("sumDigits(%d)->%d\n", 49, sumDigits(49));
	printf("sumDigits(%d)->%d\n", 12, sumDigits(12));
}

int functional(const int n) {
	return (n <= 1 ? 1 : functional(n - 1) * n);
}

int fibonacci(const int n) {
	if (n < 1) {
		return 0;
	}
	else if (n == 1) {
		return 1;
	}
	else {
		return fibonacci(n - 2) + fibonacci(n - 1);
	}
}

int bunnyEars(const int n) {
	if (n < 1) {
		return 0;
	}
	else {
		return bunnyEars(n - 1) + (n % 2 ? 2 : 3);
	}
}

int powerN(const int base, const int exponent) {
	if (exponent < 1) {
		return 1;
	}
	else {
		return powerN(base, exponent - 1) * base;
	}
}

int sumDigits(const int n) {
	if (n < 1) {
		return 0;
	}
	else {
		return sumDigits(n / 10) + (n % 10);
	}
}
