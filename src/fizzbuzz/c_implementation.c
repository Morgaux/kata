#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define WORD_LENGTH 256

int main(char argv[], int argc) {
	char * output = malloc(sizeof (char) * WORD_LENGTH);
	int i, j, k;

	for (i = 1; i <= 100; i++) {
		/* Reset output */
		free(output);
		output = malloc(sizeof (char) * WORD_LENGTH);

		/* Add fizz to output */
		if (i % 3 == 0) {
			strcat(output, "Fizz");
		}

		/* Add buzz to output */
		if (i % 5 == 0) {
			strcat(output, "Buzz");
		}

		/* Print output unless it's empty, then just print the number */
		if (output[0] == 0x00) {
			printf("%d\n", i);
		} else {
			printf("%s\n", output);
		}
	}

	return 0;
}

