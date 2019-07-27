# coding: utf-8
def isExactlyAsString(anobj):
	return type(anobj) is type('')

if __name__ == "__main__":
	print isExactlyAsString("Hello")
	print isExactlyAsString(['a','b','c'])
