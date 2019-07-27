def binary_search(seq, num, low=0, upper=None):
    if upper is None: upper = len(seq)-1
    if low > upper:
        assert num == seq[upper]
        return upper
    else:
        mid = (low + upper) // 2
        if num == seq[mid]:
            return mid
        elif num > seq[mid]:
            return binary_search(seq, num, mid+1, upper)
        else:
            return binary_search(seq, num, low, mid)

seq_target = [25, 34, 56, 12, 3]
seq_target.sort()
print(seq_target)
b = binary_search(seq_target, 34)
print(b)