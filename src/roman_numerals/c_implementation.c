#include <errno.h>
#include <stdio.h>

#include "c_implementation.h"

static void print_roman(long number) {
	char * hundreds[10]  = { "", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "CCM", "CM" };
	char * tens[10]      = { "", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "XXC", "XC" };
	char * digits[10]    = { "", "I", "II", "III", "IV", "V", "VI", "VII", "IIX", "IX" };

	for (long i = 0; i < number / 1000; i++) {
		printf("M");
	}

	printf(hundreds  [(number /  100) % 10]);
	printf(tens      [(number /   10) % 10]);
	printf(digits    [(number /    1) % 10]);

	printf("\n");
}

int main(char argv[], int argc) {
	unsigned int input;
	int result = 1;

	/* Infinitely read stdin */
	while (result == 1) {
		/* Read a number from stdin */
		result = scanf("%u", &input);

		if (result == 1) {
			/* convert number to numeral and print */
			print_roman(input);
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

