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

static void err(char * msg) { /* {{{ */
	fprintf(stderr, "%s\n", msg);
} /* }}} */

static void die(char * msg) { /* {{{ */
	err(msg);
	exit((errno == 0) ? -1 : errno);
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

static char * parseArgByName(char * argStr, char * argName) { /* {{{ */
	int index = 0, i;
	char * arg = malloc(sizeof (char) * MAX_LINE_LENGTH),
	     * tmp = malloc(sizeof (char) * MAX_LINE_LENGTH);

	index = indexOfWord(argStr, argName);

	if (index > -1) {
		/* add everything after marker to result */
		strcat(tmp, argStr + index + strlen(argName) + 1);

		/* find whitespace */
		index = indexOfChar(tmp, ' ');
		if (index == -1) {
			index = indexOfChar(tmp, '\t');
		}
		if (index == -1) {
			index = indexOfChar(tmp, '\n');
		}
		if (index == -1) {
			index = indexOfChar(tmp, '\0');
		}

		/* strip the rest of line */
		if (index > -1) {
			for (i = 0; i < index; i ++) {
				*(arg + i) = *(tmp + i);
			}
			*(arg + i) = '\0'; // null terminator
		} else {
			err("Error in parsing argument:");
			die(argName);
		}
	}

	free(tmp);

	return arg;
} /* }}} */

int main(char argv[], int argc) { /* {{{ */
	size_t line_length;
	char * line_string = malloc(sizeof (char) * MAX_LINE_LENGTH),
	     * key         = malloc(sizeof (char) * MAX_KEY_LENGTH),
	     * msg         = malloc(sizeof (char) * MAX_MSG_LENGTH),
	     * plain       = malloc(sizeof (char) * MAX_MSG_LENGTH),
	     * cipher      = malloc(sizeof (char) * MAX_MSG_LENGTH),
	     * lower       = NULL;

	while (1) {
		switch (getline(&line_string, &line_length, stdin)) {
		case EINVAL:
		case ENOMEM:
		case -1:
			if (errno != 0) {
				/* error due to actually error, not EOF */
				err("getline() returned exited with code:");
				die(errno);
			}

			return 0; /* exit 0 on EOF */

		default:
			/* line read of EOF reached */
			lower = toLower(line_string);

			/* parse key */
			key = parseArgByName(lower, "key");

			/* parse message */
			msg = parseArgByName(lower, "msg");

			/* parse plaintext */
			plain = parseArgByName(lower, "plain");

			/* parse ciphertext */
			cipher = parseArgByName(lower, "cipher");

			/* parse action */
			if (indexOfWord(lower, "encode") == 0) {
			} else if (indexOfWord(lower, "decode") == 0) {
			} else if (indexOfWord(lower, "decipher") == 0) {
			} else {
			}

			free(line_string);
			free(key);
			free(msg);
			free(plain);
			free(cipher);
			free(lower);
		}
	}

	return 1; /* unreachable */
} /* }}} */

