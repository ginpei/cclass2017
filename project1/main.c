#include <stdio.h>
#include <string.h>
#include "getwords.h"

#define ERR_ARGS 1
#define ERR_FILE_OPEN 2
#define ERR_FILE_READ 3

const char * const definedCommands[] = {
	"Image",
	"lineTo",
	"End",
	"print",
	"draw",
	"translate",
	"child",
};
const int numDefinedOperators = sizeof(definedCommands) / sizeof(definedCommands[0]);
// TODO image definition and comment

int main(int argc, char *argv[]) {
	if (argc != 2) {
		return ERR_ARGS;
	}

	const char *path = argv[1];
	printf("%s started on %s\n", argv[0], __TIME__);
	printf("Input file: %s\n", path);

	FILE *fp = fopen(path, "r");
	if (fp == NULL) {
		return ERR_FILE_OPEN;
	}

	int counts[numDefinedOperators] = { 0 };

	const int max = 1024;
	char line[max];
	while (fgets(line, max, fp) != NULL) {
		const int maxTokens = 8;
		char *tokens[maxTokens];
		const int numTokens = getwords(line, tokens, maxTokens);

		const char *command = tokens[0];
		for (int i = 0; i < numDefinedOperators; i++) {
			const char *definedCommand = definedCommands[i];
			if (strcmp(command, definedCommand) == 0) {
				counts[i]++;
				break;
			}
		}
	}

	for (int i = 0; i < numDefinedOperators; i++) {
		printf("%d %s command(s) \n", counts[i], definedCommands[i]);
	}

	fclose(fp);

	return 0;
}
