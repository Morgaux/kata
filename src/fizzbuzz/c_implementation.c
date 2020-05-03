#include <stdio.h>

#include "c_implementation.h"

int main(char argv[], int argc) {
	int i, printed = 0;

	for (i = 1; i <= 100; i++) {
		/* Add fizz to output */
		if (i % 3 == 0) {
			printed = 1;
			printf("Fizz");
		}

		/* Add buzz to output */
		if (i % 5 == 0) {
			printed = 1;
			printf("Buzz");
		}

		/* Print the number */
		if (!printed) {
			printf("%d", i);
		}

		/* Print line feed */
		printf("\n");

		/* Reset printed */
		printed = 0;
	}

	return 0;
}

