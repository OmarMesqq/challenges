# Even numbers: 2n 
# Odd numbers: 2n + 1


def get_goldbach_odd(primes: []):
    """ 

    """
    goldbachOdds = []
    naturals = range(100)

    for prime in primes: 
        for natural in naturals:
            goldbachOdds.append(prime + 2 * natural**2)


    return goldbachOdds



primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
odds = get_goldbach_odd(primes) 
print(odds)
