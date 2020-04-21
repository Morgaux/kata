/**
 * A C alphabet_cipher implementation
 */

#include <ctype.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_MSG_LENGTH 128
#define MAX_KEY_LENGTH 512
#define MAX_LINE_LENGTH (MAX_MSG_LENGTH + MAX_KEY_LENGTH + 16)
#define NUM_OF_LETTERS 26

static const char letters[NUM_OF_LETTERS] = { /* {{{ */
	'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
	'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
}; /* }}} */

static char * encode(char * key, char * msg) { /* {{{ */
	return "";
} /* }}} */

static char * decode(char * key, char * msg) { /* {{{ */
	return "";
} /* }}} */

static char * decipher(char * plain, char * cipher) { /* {{{ */
	return "";
} /* }}} */

static int indexOfChar(char * str, char search) { /* {{{ */
	int index = 0;

	while (*(str + index) != '\0') {
		if (*(str + index) == search) {
			return index;
		}

		index++;
	}

	return -1; /* -1 means not found */
} /* }}} */

static int indexOfWord(char * str, char * word) /* {{{ */ {
	int index = 0;
	char * substr = strstr(str, word);

	if (substr != NULL) {
		return substr - str; /* distance from str to substr */
	}

	return -1; /* -1 means not found */
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
	int index = 0, i;
	char * line_string = malloc(sizeof (char) * MAX_LINE_LENGTH),
	     * key         = malloc(sizeof (char) * MAX_KEY_LENGTH),
	     * key_arg     = "key",
	     * msg         = malloc(sizeof (char) * MAX_MSG_LENGTH),
	     * msg_arg     = "msg",
	     * plain       = malloc(sizeof (char) * MAX_MSG_LENGTH),
	     * plain_arg   = "plain",
	     * cipher      = malloc(sizeof (char) * MAX_MSG_LENGTH),
	     * cipher_arg  = "cipher",
	     * lower       = NULL,
	     * result      = malloc(sizeof (char) * MAX_LINE_LENGTH);

	while (1) {
		switch (getline(&line_string, &line_length, stdin)) {
		case EINVAL:
		case ENOMEM:
		case -1:
			if (errno != 0) {
				/* error due to actually error, not EOF */
				fprintf(stderr, "getline() returned exited with code %d.\n", errno);
			}

			return errno; /* will be 0 on EOF */

		default:
			/* line read of EOF reached */
			lower = toLower(line_string);

			/* parse key */
			index = indexOfWord(lower, key_arg);
			if (index > -1) {
				/* add everything after marker to result */
				strcat(result, lower + index + strlen(key_arg) + 1);

				/* find whitespace */
				index = indexOfChar(result, ' ');
				if (index == -1) {
					index = indexOfChar(result, '\t');
				}
				if (index == -1) {
					index = indexOfChar(result, '\n');
				}
				if (index == -1) {
					index = indexOfChar(result, '\0');
				}

				/* strip the rest of line */
				if (index > -1) {
					for (i = 0; i < index; i ++) {
						*(key + i) = *(result + i);
					}
				} else {
					fprintf(stderr, "Couldn't parse key.\n");
					return -1;
				}
			}
			printf("key: %s\n", key);

			/* parse message */
			printf("msg: %s\n", msg);

			/* parse plaintext */
			printf("plain: %s\n", plain);

			/* parse ciphertext */
			printf("cipher: %s\n", cipher);

			free(lower);
		}
	}

	return 1; /* unreachable */
} /* }}} */

