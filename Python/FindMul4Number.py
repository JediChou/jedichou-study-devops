# coding: utf-8

if __name__ == "__main__":

    """find 21978 * 4 = 87912"""

    nums = range(10000, 50000)

    def GetExpectedResult(n):
        return n * 4

    def GetMulti4Result(n):
        return int(str(n)[::-1])

    for n in nums:
        result1 = GetMulti4Result(n)
        result2 = GetExpectedResult(n)
        if (result1 == result2):
            print(n, n * 4)
