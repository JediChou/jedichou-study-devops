#!/usr/bin/env/python

from __future__ import print_function
import sys
from datetime import datetime
import numpy as np

"""
    Chapter 1 of NumPy Beginners Guide.
    This program demostrates vector addition the Python way.
    Run from the command line as follows
    
      python vectorsum.py n

    where n is an integer that specifies the size of the vectos.
    The first vector to be added contains the squares of 0 up to n.
    The second vector contains the cubes of 0 up to n.
    The program prints the last 2 elements of the sum and the eplased
    time.
"""

def pythonsum(n):
    """Adding vectors using pure Python"""
    a = range(n)
    b = range(n)
    c = []

    for i in range(len(a)):
        a[i] = i ** 2
        b[i] = i ** 3
        c.append(a[i] + b[i])

    return c

def numpysum(n):
    a = np.arange(n) ** 2
    b = np.arange(n) ** 3
    c = a + b
    return c

if __name__ == "__main__":
    """Program start here."""

    size = int(sys.argv[1])

    """Check pythonsum function"""
    start = datetime.now()
    c = pythonsum(size)
    delta = datetime.now() - start
    print("The last 2 elements of he sum", c[-2:])
    print("PythonSum elapsed time in ms: ", delta.microseconds)

    """Check numpysum function"""
    start = datetime.now()
    c = numpysum(size)
    delta = datetime.now() - start
    print()
    print("The last 2 elements of he sum", c[-2:])
    print("numpysum elapsed time in ms: ", delta.microseconds) 
