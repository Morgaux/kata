#include <stdio.h>

#define WORD_LENGTH 256
#define LEN(x) (sizeof(x) / sizeof((x)[0]))

int main(char argv[], int argc) {
	char output[WORD_LENGTH], fizz[] = "Fizz", buzz[] = "Buzz";
	int i, j, k;

	for (i = 1; i <= 100; i++) {
		/* Reset output */
		for (j = 0; j < WORD_LENGTH; j++) {
			output[j] = 0x00;
		}

		/* Reset output index */
		j = 0;

		/* Add fizz to output */
		for (k = 0; k < LEN(fizz) - 1 && i % 3 == 0; k++) {
			output[j++] = fizz[k];
		}

		/* Add buzz to output */
		for (k = 0; k < LEN(buzz) - 1 && i % 5 == 0; k++) {
			output[j++] = buzz[k];
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

