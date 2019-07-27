import timeit

t = timeit.Timer("""
    def funa():
        return 1
    def funb():
        return 2

    for item in range(0, 100):
        funa()
    for item in range(0, 100):
        funb()
""")
print type(t.timeit())
#print t.repeat(3, 100)
