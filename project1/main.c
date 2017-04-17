#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "getwords.h"

#define ERR_ARGS 1
#define ERR_FILE_OPEN 2
#define ERR_FILE_READ 3

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
const int numDefinedOperators = sizeof(definedCommands) / sizeof(definedCommands[0]);

int main(int argc, char *argv[]) {
	struct Struct_Student {
		int id;
		char name[128];
	};
	typedef struct Struct_Student Student;
	Student students[] = {
		{ 1, "Alice" },
		{ 2, "Bob" },
		{ 0, "" },  // guard
	};
	for (int i = 0; students[i].id != 0; i++) {
		Student student = students[i];
		printf("#%05d %s\n", student.id, student.name);
	}
	return 0;

	if (argc != 2) {
		return ERR_ARGS;
	}

	const char *path = argv[1];
	printf("%s started on ", argv[0]);
	fflush(stdout);
	system("date");
	printf("\n");
	printf("Input file: %s\n", path);

	FILE *fp = fopen(path, "r");
	if (fp == NULL) {
		return ERR_FILE_OPEN;
	}

	int counts[numDefinedOperators + 2] = { 0 };
	const int indexImageDefinitionCount = numDefinedOperators;
	const int indexCommentCount = numDefinedOperators + 1;

	const int max = 1024;
	char line[max];
	while (fgets(line, max, fp) != NULL) {
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
			for (int i = 0; i < numDefinedOperators; i++) {
				const char *definedCommand = definedCommands[i];
				if (strcmp(command, definedCommand) == 0) {
					counts[i]++;
					break;
				}
			}
		}
	}

	printf("%d %s definition(s)\n", counts[indexImageDefinitionCount], imageDefinitionKeyword);
	for (int i = 0; i < numDefinedOperators; i++) {
		printf("%d %s command(s)\n", counts[i], definedCommands[i]);
	}
	printf("%d comment(s)\n", counts[indexCommentCount]);

	fclose(fp);

	return 0;
}
