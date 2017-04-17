#include <stdio.h>
#include <string.h>

#include "lib/getline2.h"

int countSentences(const char line[]);
int countVowels(const char line[]);
int countLetters(const char line[], const char candidates[], const int numCandidates);

int main() {
	const int max = 1024;
	char line[max];
	int numSentences = 0;
	int numVowels = 0;

	printf("C-d to finish.\n");
	while (1) {
		if (getline2(line, max) == EOF) {
			break;
		}

		numSentences += countSentences(line);
		numVowels += countVowels(line);
	}

	printf("\n");
	printf("You entered %d sentences containing %d vowels.\n", numSentences, numVowels);
}

int countSentences(const char line[]) {
	const char candidates[] = ".";
	return countLetters(line, candidates, 1);
}

int countVowels(const char line[]) {
	const char candidates[] = "aeiou";
	return countLetters(line, candidates, 5);
}

int countLetters(const char line[], const char *candidates, const int numCandidates) {
	int count = 0;
	for (int i = 0; i < numCandidates; i++) {
		const char *candidate = candidates + i;
		for (const char *p = line; *p != '\0'; p++) {
			if (*p == *candidate) {
				count += 1;
			}
		}
	}
	return count;
}
