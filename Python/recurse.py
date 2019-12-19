# coding: utf-8

def binary_search(seq, num, low=0, upper=None):

    """二分法搜索示例"""

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


if __name__ == "__main__":
    
    # 创建一个list, 用内置方法排序后输出
    seq = [25, 34, 56, 12, 3, 99, 88]
    seq.sort()
    print(seq)

    # 通过自定义方法查找目标数字的下标, 并打印
    b = binary_search(seq, 34)
    print(b)