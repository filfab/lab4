import math

def PrimeNumbers(n: int) -> int:
    """Returns number of primes less than or equal to n."""

    def create_sieve(s, n):
        s.append(False) #0
        s.append(False) #1
        s.append(True)  #2
        for i in range(3, n+1):
            s.append(i%2 != 0)


    def compute_sieve(s):
        k = int(math.sqrt(len(s)))
        for i in range(3, k, 2):
            if s[i]:
                j = i * i
                while j < len(s):
                    s[j] = False
                    j = j + i


    def count_primes(s):
        c = 0
        for i in s:
            if i:
                c += 1
        return c
    
    if n < 2:
        return 0

    s = []
    create_sieve(s, n)
    compute_sieve(s)
    c = count_primes(s)
    return c


def Prime(n: int) -> int:
    """Returns n-th prime."""

    if n < 1:
        print('n has to be grater than 0')
        exit(-1)

    primes = [2]
    suspected = 3

    while len(primes) < n:
        sus_is_prime = True
        for i in primes[1:]:
            if suspected % i == 0:
                sus_is_prime = False
                break
        
        if sus_is_prime:
            primes.append(suspected)
        suspected += 2
    
    return primes[-1]


def IsPrime(n: int) -> bool:
    """Returns whether n is prime"""

    if n in { 2, 3, 5 }:
        return True

    if n == 1 or 0 in { n%2, n%3, n%5 }:
        return False

    i = 6
    k = int(math.sqrt(n))

    while i <= k:
        if n%(i+1)==0 or n%(i+5)==0:
            return False
        i += 6

    return True
