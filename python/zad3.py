import sys
import modules.inout as io
from modules.zad3 import *

def main():
    if len(sys.argv) == 1:
        print('pn: PrimeNumbers | pr: Prime | ip: IsPrime')
    func, n = io.get_input(str, int)

    match func:
        case 'pn': print(PrimeNumbers(n))

        case 'pr': print(Prime(n))

        case 'ip': print(IsPrime(n))

        case _: print(f'"{func}" is not recognized')

if __name__ == '__main__':
    main()