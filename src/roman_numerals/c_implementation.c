#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define WORD_SIZE 512

char * roman(int number) {
	char * output = malloc(sizeof (char) * WORD_SIZE);
	char * hundreds[10]  = { "", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "CCM", "CM" };
	char * tens[10]      = { "", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "XXC", "XC" };
	char * digits[10]    = { "", "I", "II", "III", "IV", "V", "VI", "VII", "IIX", "IX" };

	for (int i = 0; i < number / 1000; i++) {
		strcat(output, "M");
	}

	strcat(output, hundreds  [(number /  100) % 10]);
	strcat(output, tens      [(number /   10) % 10]);
	strcat(output, digits    [(number /    1) % 10]);

	return output;
}

int main(char argv[], int argc) {
	int input, result = 1;
	char * output; /* will need to be freed after use */

	/* Infinitely read stdin */
	while (result == 1) {
		/* Read a number from stdin */
		result = scanf("%d", &input);

		if (result == 1) {
			/* convert number to numeral and print */
			output = roman(input);
			printf("%s\n", output);
			free(output);
		} else if (result == EOF && errno == 0) {
			/* output empty line and return success */
			return 0;
		} else if (result != 0) {
			/* print error message and return >0 */
			perror("scanf");
			return errno == 0 ? 1 : errno;
		} else {
			/* fallback error message */
			fprintf(stderr, "No matching characters.\n");
			return errno == 0 ? 1 : errno;
		}
	}

	/* generic error exit code */
	return 1;
}

