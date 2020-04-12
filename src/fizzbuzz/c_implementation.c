#include <stdio.h>

int main(char argv[], int argc) {
	for (int i = 0; i < 100; i++) {
		printf("%d\n", i + 1); // print accounting for off by one
	}

	return 0;
}

