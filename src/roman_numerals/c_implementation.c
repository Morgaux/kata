#include <errno.h>
#include <stdio.h>

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
			printf("%d\n", input);
		}
	}

	/* unreachable generic error exit code */
	return 1;
}

