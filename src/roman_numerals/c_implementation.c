#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define WORD_SIZE 512

char * roman(int number) {
	char * output = malloc(sizeof (char) * WORD_SIZE);
	char * thousands[10] = { "", "I", "II", "III", "IV", "V", "VI", "VII", "IIX", "IX" };
	char * hundreds[10]  = { "", "I", "II", "III", "IV", "V", "VI", "VII", "IIX", "IX" };
	char * tens[10]      = { "", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "XXC", "XC" };
	char * digits[10]    = { "", "I", "II", "III", "IV", "V", "VI", "VII", "IIX", "IX" };

	strcat(output, thousands [(number / 1000) % 10]);
	strcat(output, hundreds  [(number /  100) % 10]);
	strcat(output, tens      [(number /   10) % 10]);
	strcat(output, digits    [(number /    1) % 10]);

	return output;
}

int main(char argv[], int argc) {
	int input;
	char * output; /* will need to be freed after use */

	/* Infinitely read stdin */
	while (1) {
		/* Read a number from stdin */
		switch (scanf("%d", &input)) {
		case 0:
			/* if no numbers where read, set error code to 1 */
			errno = 1;
		case EOF:
			/* EOF may indicate an error or end of input */
			return errno;

		default:
			/* Print number back to stdout */
			output = roman(input);
			printf("%s\n", output);
			free(output);
		}
	}

	/* unreachable generic error exit code */
	return 1;
}

