
'''
url: http://www.king-liu.net/?p=960
1. Problem:
  Give an array of integers, find two numbers such that
  they add up to a specific target number.
  The function twoSum should return indices of two numbers
  such that they add up to the target. where index1 must
  be less than index2. Please note that your returned
  answers (both index1 and index2) are not zero-based.
2. Input: numbers = [2, 7, 11, 15], target = 9
3. Output: index1 = 1, index2 = 2
'''

import time

def calculate(numbers, target):
	for first in numbers:		
		for second in numbers:
			if numbers.index(first) != numbers.index(second) and (first + second) == target :
				return [first, second]
	return []

if __name__ == "__main__":
	start_time = time.clock()
	
	''' pre-design input '''	
	numbers = [2, 7, 11, 15]
	target = 18
	
	''' get result '''
	start_time = time.clock()
	numbers.sort()
	result = calculate(numbers, target)

	''' output '''
	if len(result) != 2:
		print "No match!"
	else:
		index1 = numbers.index(result[0]) + 1
		index2 = numbers.index(result[1]) + 1
		print "index1 = %s, index2 = %s" % (index1, index2)

	''' execute time '''
	print "--- %s seconds ---" % (time.clock() - start_time)  
