#include <stdbool.h>
#include <stdlib.h>
#include <math.h>
#include "zad1.h"

unsigned prime_numbers(unsigned n) {
    bool *s ;
    s = malloc((n+1)*sizeof(bool));
    compute_sieve(s, n);
    int i, c = 0;
    if (n >= 2) {
        c++;
        for (i=3; i<=n; i+=2) {
            if (s[i]) { c++; }
        }
    } 
    free(s);
    return c;
}

unsigned prime(unsigned n) {
    unsigned m = n;
    unsigned primes[m], suspected = 3, counter = 1;
    primes[0] = 2;
    bool sus_is_prime;

    while (counter < m) {
        sus_is_prime = true;
        for (int i = 1; i < counter; i++) {
            if (suspected % primes[i] == 0) {
                sus_is_prime = false;
                break;
            }
        }

        if (sus_is_prime) {
            primes[counter] = suspected;
            counter++;
        }
        suspected += 2;
    }
    return primes[counter-1];
}

bool is_prime(unsigned n) {
    if ( n==2 || n==3 || n==5 ) { return true; }
    if ( n==1 || n%2==0 || n%3==0 || n%5==0 ) { return false; }

    unsigned i = 6;
    unsigned k = sqrt(n);
    while (i <= k) {
        if ( n%(i+1)==0 || n%(i+5)==0 ) { return 0; }
        i += 6;
    }
    return true;
}

void compute_sieve(bool s[], unsigned n) {
    unsigned i, j, k;
    for (i=3; i<=n; i++) { s[i] = i%2!=0; }
    s[0] = false;
    s[1] = false;
    s[2] = true;
    k = sqrt(n);

    for (i=3; i<=k; i+=2) {
        if (s[i]) {
            for (j=i*i; j<=n; j+=i) {
                s[j] = false;
            }
        }
    }
}
