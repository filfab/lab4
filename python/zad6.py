import modules.inout as io
from modules.zad6 import Totient, UndefinedError

def main():
    numbers = io.get_input(int, varsize=True)

    for n in numbers:
        try:
            print(f'totient({n}) = {Totient(n)}')
        except UndefinedError as e:
            print(e.message)

if __name__ == '__main__':
    main()