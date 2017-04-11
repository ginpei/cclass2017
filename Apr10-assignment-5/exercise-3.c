#include <stdio.h>

int countchars(char string[], int ch);

int main() {
	char string[] = "Hello, world!";
	char ch = 'o';
	printf("In [%s], number of [%c] is %d.\n", string, ch, countchars(string, ch));
	return 0;
}

int countchars(char string[], int ch) {
	int count = 0;
	for (int i = 0; string[i] != '\0'; i++) {
		if (string[i] == ch) {
			count++;
		}
	}
	return count;
}
