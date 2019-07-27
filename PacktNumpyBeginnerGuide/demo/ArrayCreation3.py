import numpy as np

def get2DArray():
    b = np.array([(1.5, 2, 3), (4, 5, 6)])
    print b
    print b.dtype

def getComplexArray():
    c = np.array([[1,2],[3,4]], dtype = complex)
    print c
    print c.dtype
    
if __name__ == '__main__':
    # File: ArrayCreation3.py
    # Desc:
    #   array transforms sequences into two-dimensional
    #   arrays, sequences of seqences into three-dimensional
    #   arrays, and so on.
    get2DArray()
    getComplexArray()
