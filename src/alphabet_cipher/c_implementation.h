/**
 * Header file for a C alphabet_cipher implementation
 */

#define MAX_MSG_LENGTH 128
#define MAX_KEY_LENGTH 512
#define MAX_LINE_LENGTH (MAX_MSG_LENGTH + MAX_KEY_LENGTH + 16)
#define NUM_OF_LETTERS 26

static const char letters[NUM_OF_LETTERS] = {
	'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
	'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
};

static void err(char*);
static void die(char*);
static void freeIfNotNull(void**);
static int isCharValid(char c);
static int indexOfChar(char*, char);
static int indexOfWord(char*, char*);
static char* toLower(char*);
static char* encode(char*, char*);
static char* decode(char*, char*);
static char* decipher(char*, char*);
static char* parseArgByName(char*, char*);
int main(char[], int);

