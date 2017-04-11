#include <stdio.h>

#define ERR_ARGS 1

int checkArgs(int argc, char *argv[]);
void printStartMessage(int argc, char *argv[]);

int main(int argc, char *argv[]) {
	if (checkArgs(argc, argv) != 0) {
		return ERR_ARGS;
	}

	printStartMessage(argc, argv);

	for (int i = 0; i < argc; i++) {
		printf("%d %s\n", i, argv[i]);
	}
	return 0;
}

/**
 * Returns error if the arguments are not correct.
 */
int checkArgs(int argc, char *argv[]) {
	if (argc != 2) {
		return ERR_ARGS;
	}

	return 0;
}

/**
 * ```
 * ./draw1a started on Wed Jul 2 21:08:40 MST 2010
 * ```
 */
void printStartMessage(int argc, char *argv[]) {
	// TODO time
	const char *pPath = argv[0];
	printf("%s started on %s\n", pPath, __TIME__);

	const char *pFilePath = argv[1];
	printf("Input file: %s\n", pFilePath);
}
