import numpy as np

def CreateAnIntArray():
    array = np.array([2,3,4])
    print array
    print array.dtype

def CreateFloat64Array():
    b = np.array([1.2, 3.5, 5.1])
    print b
    print b.dtype

if __name__ == "__main__":
    # File: ArrayCreation1.py
    # Description: Array Creation
    # Ref: https://docs.scipy.org/doc/numpy-dev/user/quickstart.html
    CreateAnIntArray()
    CreateFloat64Array()