#include <stddef.h>
#include <ctype.h>

int getwords(char *line, char *words[], int maxwords)
{
	char *p = line;
	int nwords = 0;

	while(1)
	{
		while(isspace(*p))
			p++;

		if(*p == '\0')
			return nwords;

		words[nwords++] = p;

		while(!isspace(*p) && *p != '\0')
			p++;
		if (*p == '\0')
			return nwords;

		*p++ = '\0';
		if (nwords >= maxwords)
			return nwords;
	}
}
