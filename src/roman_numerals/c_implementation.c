#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define WORD_SIZE 512

char * roman(int number) {
	char * output = malloc(sizeof (char) * WORD_SIZE);
	int i;

	/* Add "M" to the output for every thousand */
	for (i = 0; i < (number / 1000) % 10; i++) {
		strcat(output, "M");
	}

	/* Add "C" to the output for every hundred */
	for (i = 0; i < (number / 100) % 10; i++) {
		strcat(output, "C");
	}

	/* Add "X" to the output for every ten */
	for (i = 0; i < (number / 10) % 10; i++) {
		strcat(output, "X");
	}

	/* Add "I" to the output for every digit */
	for (i = 0; i < number % 10; i++) {
		strcat(output, "I");
	}

	return output;
}

int main(char argv[], int argc) {
	int input;

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
			printf("%s\n", roman(input));
		}
	}

	/* unreachable generic error exit code */
	return 1;
}

