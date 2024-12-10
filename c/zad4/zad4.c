#include <stdlib.h>
#include "zad4.h"
#include "list.h"

int count(unsigned *n, int factor) {
    int counter = 0;
    while ( *n % factor == 0 ) {
        counter++;
        *n /= factor;
    }
    return counter;
}

void factorize(list_t l, unsigned n) {
    unsigned number = n;
    unsigned base = 2;
    unsigned exponent = count(&number, base);

    if (exponent > 0) { append(l, Init(base, exponent)); }

    base = 3;
    while (number > 1) {
        exponent = count(&number, base);
        if (exponent > 0) { append(l, Init(base, exponent)); }
        base += 2;
    }
}

unsigned totient(unsigned n) {
    if (n == 0) { return 0; }
    list_t factors = malloc(sizeof(list_struct));
    factors->first = factors->last = NULL;
    factorize(factors, n);
    factor f;
    unsigned base, exponent, ans = 1;

    if (n != 1) {
        while (!is_empty(factors)){
            f = pop(factors);
            base = f.base;
            exponent = f.exponent;
            ans *= base - 1;
            for (unsigned i=1; i<=exponent-1; i++) {
                ans *= base;
            }
        }
    }
    clean(factors);
    free(factors);
    return ans;
}
