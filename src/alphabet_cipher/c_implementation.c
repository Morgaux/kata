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

static void err(char * msg) { /* {{{ */
	fprintf(stderr, "%s\n", msg);
} /* }}} */

static void die(char * msg) { /* {{{ */
	err(msg);
	exit((errno == 0) ? -1 : errno);
} /* }}} */

static void freeIfNotNull(char * str) { /* {{{ */
	if (str != NULL) {
		free(str);
	}
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

static const char letters[NUM_OF_LETTERS] = { /* {{{ */
	'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
	'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
}; /* }}} */

static char * encode(char * key, char * msg) { /* {{{ */
	char * out = malloc(sizeof (char) * MAX_MSG_LENGTH);
	int i, j, key_index, msg_index;

	for (i = 0; i < strlen(msg); i++) {
		for (j = 0; j < NUM_OF_LETTERS; j++) {
			if (*(key + (i % strlen(key))) == letters[j]) {
				key_index = j;
				break;
			}
		}
		for (j = 0; j < NUM_OF_LETTERS; j++) {
			if (*(msg + i) == letters[j]) {
				msg_index = j;
				break;
			}
		}

		*(out + i) = letters[(key_index + msg_index) % NUM_OF_LETTERS];
	}

	return out;
} /* }}} */

static char * decode(char * key, char * msg) { /* {{{ */
	char * out = malloc(sizeof (char) * MAX_MSG_LENGTH);
	int i, j, key_index, msg_index;

	for (i = 0; i < strlen(msg); i++) {
		for (j = 0; j < NUM_OF_LETTERS; j++) {
			if (*(key + (i % strlen(key))) == letters[j]) {
				key_index = j;
				break;
			}
		}
		for (j = 0; j < NUM_OF_LETTERS; j++) {
			if (*(msg + i) == letters[(j + key_index) % NUM_OF_LETTERS]) {
				msg_index = j;
				break;
			}
		}

		*(out + i) = letters[(msg_index) % NUM_OF_LETTERS];
	}

	return out;
} /* }}} */

static char * decipher(char * plain, char * cipher) { /* {{{ */
	char * out = malloc(sizeof (char) * MAX_KEY_LENGTH),
	     * tmp = malloc(sizeof (char) * MAX_LINE_LENGTH);
	int i, j, key_index, msg_index;

	for (i = 0; i < strlen(plain); i++) {
		for (j = 0; j < NUM_OF_LETTERS; j++) {
			*(out + i) = letters[j];
			tmp = encode(out, plain);

			if (*(tmp + i) == *(cipher + i)) {
				break;
			}

			freeIfNotNull(tmp);
			tmp = NULL;
		}
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
	     * key         = NULL,
	     * msg         = NULL,
	     * plain       = NULL,
	     * cipher      = NULL,
	     * lower       = NULL,
	     * result      = NULL;

	while (1) {
		switch (getline(&line_string, &line_length, stdin)) {
		case EINVAL:
		case ENOMEM:
		case -1:
			if (errno != 0) {
				/* error due to actually error, not EOF */
				die("getline() returned exited with error");
			}

			return 0; /* exit 0 on EOF */

		default:
			/* line read of EOF reached */
			lower = toLower(line_string);

			/* parse key */
			key = parseArgByName(lower, "key");

			/* parse message */
			msg = parseArgByName(lower, "message");

			/* parse plaintext */
			plain = parseArgByName(lower, "plaintext");

			/* parse ciphertext */
			cipher = parseArgByName(lower, "ciphertext");

			/* parse action */
			if (indexOfWord(lower, "encode") == 0) {
				result = encode(key, msg);
			} else if (indexOfWord(lower, "decode") == 0) {
				result = decode(key, msg);
			} else if (indexOfWord(lower, "decipher") == 0) {
				result = decipher(plain, cipher);
			} else {
				die("Couldn't parse action.");
			}

			printf("%s\n", result);

			/* memory management */
			freeIfNotNull(key);
			freeIfNotNull(msg);
			freeIfNotNull(plain);
			freeIfNotNull(cipher);
			freeIfNotNull(lower);
			freeIfNotNull(result);

			key    = NULL;
			msg    = NULL;
			plain  = NULL;
			cipher = NULL;
			lower  = NULL;
			result = NULL;
		}
	}

	return 1; /* unreachable */
} /* }}} */

