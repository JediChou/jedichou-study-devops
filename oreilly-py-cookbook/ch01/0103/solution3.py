# coding:utf-8
def isStringLike(obj):
	try: anobj + ''
	except: return False
	else: return True

if __name__ == "__main__":
	print isStringLike("Hello")  # Jedi: something wrong ?
	print isStringLike([1,2,3])
	print isStringLike(['a','b','c'])
