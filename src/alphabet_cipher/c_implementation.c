/**
 * A C alphabet_cipher implementation
 */

#include <ctype.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LINE_LENGTH 512

static char letters[] = { /* {{{ */
	'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
	'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
}; /* }}} */

static char * encode(char * key, char * msg) { /* {{{ */
	int i, len = strlen(msg);
	char * out = malloc(sizeof (char) * (len + 1));

	return out;
} /* }}} */

static char * decode(char * key, char * msg) { /* {{{ */
	int i, len = strlen(msg);
	char * out = malloc(sizeof (char) * (len + 1));

	return out;
} /* }}} */

static char * decipher(char * plain, char * cipher) { /* {{{ */
	int i, len = strlen(plain);
	char * out = malloc(sizeof (char) * (len + 1));

	return out;
} /* }}} */

static char * toLower(char * str) { /* {{{ */
	int i, len = strlen(str);
	char * out = malloc(sizeof (char) * (len + 1));

	for (i = 0; i < len; i++) {
		*(out + i) = tolower(*(str + i));
	}

	return out;
} /* }}} */

int main(char argv[], int argc) { /* {{{ */
	size_t line_length;
	char * line_string = NULL,
	     * key         = NULL,
	     * msg         = NULL,
	     * plain       = NULL,
	     * cipher      = NULL,
	     * result      = NULL;

	while (1) {
		switch (getline(&line_string, &line_length, stdin)) {
		case EINVAL:
		case ENOMEM:
		case -1:
			if (errno != 0) {
				/* error due to actually error, not EOF */
				fprintf(stderr, "getline() returned exited with code %d.");
			}

			return errno; /* will be 0 on EOF */

		default:
			/* line read of EOF reached */
			result = toLower(line_string);
			printf(result);
			free(result);
		}
	}

	return 1; /* unreachable */
} /* }}} */

