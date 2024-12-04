#include <stdio.h>
#include <string.h>
#include "zad1.h"

int main(int argc, char const *argv[]) {
    if (argc != 3) {
        printf("Bad number of arguments\n");
        return -1;
    }

    unsigned n;
    if (sscanf(argv[2], "%u", &n) != 1) {
        printf("Bad argument\n");
        return -1;
    }

    if (!strcmp(argv[1], "pn")) {
        printf("%u\n", prime_numbers(n));
    } else if (!strcmp(argv[1], "pr")) {
        printf("%u\n", prime(n));
    } else if (!strcmp(argv[1], "ip")) {
        printf(is_prime(n) ? "true\n" : "false\n");
    } else {
        printf("Unknown command\n");
    }
    return 0;
}
