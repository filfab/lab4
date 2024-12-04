#include <stdio.h>
#include "zad4.h"

int main(int argc, char const *argv[]) {
    if (argc == 1) {
        printf("No arguments given\n");
        return 0;
    }

    unsigned n;
    for (int i=1; i<argc; i++) {
        if (sscanf(argv[i], "%u", &n) != 1) {
            printf("Skipped bad argument (%s)\n", argv[i]);
            continue;
        }
        printf("Totient(%u) = %u\n", n, totient(n));
    }
    return 0;
}
