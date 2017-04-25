#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "getwords.h"

#define ERR_ARGS 1
#define ERR_FILE_OPEN 2
#define ERR_FILE_READ 3

int countLine(int counts[], char line[]);

const char *imageDefinitionKeyword = "Image";
const char *commendStartKeyword = "#";
const char * const definedCommands[] = {
	"lineTo",
	"End",
	"print",
	"draw",
	"translate",
	"child",
};
// const int numDefinedCommands = sizeof(definedCommands) / sizeof(definedCommands[0]);
#define numDefinedCommands 6
	const int indexImageDefinitionCount = numDefinedCommands + 0;
	const int indexCommentCount = numDefinedCommands + 1;

int main(int argc, char *argv[]) {
	if (argc != 2) {
		return ERR_ARGS;
	}

	// print start message
	const char *path = argv[1];
	printf("%s started on ", argv[0]);
	fflush(stdout);
	system("date");
	printf("\n");
	printf("Input file: %s\n", path);

	// open file
	FILE *fp = fopen(path, "r");
	if (fp == NULL) {
		return ERR_FILE_OPEN;
	}

	// prepare counts: 6 commands + 1 image definition + 1 comment
	int counts[numDefinedCommands + 2] = { 0 };

	// count
	const int max = 1024;
	char line[max];
	while (fgets(line, max, fp) != NULL) {
		countLine(counts, line);
	}

	// print the result
	printf("%d %s definition(s)\n", counts[indexImageDefinitionCount], imageDefinitionKeyword);
	for (int i = 0; i < numDefinedCommands; i++) {
		printf("%d %s command(s)\n", counts[i], definedCommands[i]);
	}
	printf("%d comment(s)\n", counts[indexCommentCount]);

	// close file
	fclose(fp);

	return 0;
}

int countLine(int counts[], char line[]) {
	const int maxTokens = 8;
	char *tokens[maxTokens];
	const int numTokens = getwords(line, tokens, maxTokens);
	const char *command = tokens[0];

	if (strcmp(command, imageDefinitionKeyword) == 0) {
		counts[indexImageDefinitionCount]++;
	}
	else if (strstr(command, commendStartKeyword) == command) {
		counts[indexCommentCount]++;
	}
	else {
		for (int i = 0; i < numDefinedCommands; i++) {
			const char *definedCommand = definedCommands[i];
			if (strcmp(command, definedCommand) == 0) {
				counts[i]++;
				break;
			}
		}
	}

	return 0;
}
