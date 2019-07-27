# File: ArrayCreation2.py
# Desc:
#   A frequent error consists in calling array
#   with multiple numeric arguments, rather than
#   providing a single list of numbers as an argument.
# Ref: https://docs.scipy.org/doc/numpy-dev/user/quickstart.html

import numpy as np

def GetIntArray():
    '''right style'''
    return np.array([1,2,3,4])

def GetIntArray_Wrong():
    '''wrong style'''
    return np.array(1,2,3,4,5)

if __name__ == '__main__':    
    try:
        print GetIntArray()
        print GetIntArray_Wrong()
    except:
        print "Some exception raise"
