#include <stdio.h>

#include "getline2.h"

int main() {
	int max = 4;
	char line[max];
	getline2(line, max);
	printf("%s\n", line);
	return 0;
}
