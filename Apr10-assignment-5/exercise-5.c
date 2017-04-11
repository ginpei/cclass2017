#include <stdio.h>
#include <string.h>

int replace(char string[], char from[], char to[]);

int main() {
	char string[] = "recieve";
	printf("%s\n", string);
	replace(string, "ie", "ei");
	printf("-> %s\n", string);

	return 0;
}

int replace(char string[], char from[], char to[]) {
	int len = strlen(from);

	// lengths of these two should be same
	if (strlen(to) != len) {
		return -1;
	}

	int p = 0;
	while (string[p] != '\0') {
		int matched = 1;
		for (int i = 0; i < len; i++) {
			if (string[p + i] != from[i]) {
				matched = 0;
				break;
			}
		}

		if (matched) {
			for (int i = 0; i < len; i++) {
				string[p + i] = to[i];
			}

			p += len;
		}

		p++;
	}

	return 0;
}
