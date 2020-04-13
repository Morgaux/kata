#include <errno.h>
#include <stdio.h>

int main(char argv[], int argc) {
	int input, error;

	/* Infinitely read stdin */
	while (1) {
		/* Read a number from stdin */
		switch (scanf("%d", &input)) {
		case 0:
			errno = 1;
		case EOF:
			return errno;

		default:
			/* Print number back to stdout */
			printf("%d\n", input);
		}
	}

	/* generic error exit code */
	return 1;
}

