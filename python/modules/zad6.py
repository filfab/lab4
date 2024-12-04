class UndefinedError(Exception):
    def __init__(self, name, n):
        self.message = f'{name} function is undefined for {n}'
        super().__init__(self.message)


def Totient(n: int) -> int:
    """Returns the number of relatively first numbers that are less than or equal to n."""

    if n < 0:
        raise UndefinedError('Totient', n)
    elif n == 0:
        return 0
    elif n == 1:
        return 1
    else:
        counter = 1
        for base, exp in factorize(n):
            counter *= base - 1
            for i in range(1,exp):
                counter *= base
        return counter


def factorize(number: int) -> list[tuple[int, int]]:
    """Returns the list of prime factors of n.
    
    The list is made of (prime, exponent) pairs, eg. factorize(12) = [(2,2),(3,1)]"""

    def count(factor):
        nonlocal n
        counter = 0
        while n%factor == 0:
            counter += 1
            n //= factor
        return counter

    if number < 2:
        raise UndefinedError('Factorize', number)

    n = number
    base = 3
    exp = count(2)
    factors = []

    if exp > 0:
        factors.append((2,exp))
    while n > 1:
        exp = count(base)
        if exp > 0:
            factors.append((base,exp))
        base += 2

    return factors
