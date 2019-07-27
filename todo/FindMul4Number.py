# find 21978 * 4 = 87912

nums = range(10000, 100001)

def GetExpectedResult(number):
    return num * 4

def GetMulti4Result(number):
    temp = str(number)[::-1]
    return int(temp)

for num in nums:
    result1 = GetMulti4Result(num)
    result2 = GetExpectedResult(num)
    if (result1 == result2):
        print num, num * 4
    
