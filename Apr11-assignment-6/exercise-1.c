#include <stdio.h>
#include <string.h>

#include "getline2.h"

int main() {
	char line[MAXLINE];
	char *words[] = {
		"hello",
		"world",
		"monay",
		"rich",
		"gold",
	};
	int numWords = sizeof(words) / sizeof(words[0]);

	printf("Input some phrases less than %d letters. C-d to quit.\n", MAXLINE);
	while (getline2(line, MAXLINE) != EOF) {
		for (int i = 0; i < numWords; i++) {
			char *pWord = words[i];
			char *p = strstr(line, pWord);
			if (p != NULL) {
				printf("-> %s\n", line);
				break;
			}
		}

	}

	return 0;
}
