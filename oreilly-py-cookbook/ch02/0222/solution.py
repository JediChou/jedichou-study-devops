# coding: utf-8

import os, itertools

def all_equal(elements):
    ''' 若所有元素都相等, 则返回True, 否则返回False '''
    first_element = elements[0];
    for other_element in elements[1:]:
        if other_element != first_element:
            return False
    return True
    
def common_prefix(*sequences):
    ''' 返回所有序列开头部分共同元素的列表
        紧接一个各序列的不同尾部的列表
    '''
    # 如果没有sequence, 完成
    if not sequences: return [], []
    # 并行地循环序列
    common = []
    for elements in itertools.izip(*sequences):
        # 若所有元素相等, 跳出循环
        if not all_equal(elements):
            break
        # 得到一个共同元素, 添加到末尾并继续
        common.append(elements[0])
    return common, [sequence[len(common):] for sequence in sequences]
    
def relpath(p1, p2, sep=os.path.sep, pardir=os.path.pardir):
    ''' 返回p1对p2的相对路径
        特殊情况: 空串, if p1 == p2;
                 p2, 如果p2和p1完全没有相同的元素
    '''
    common, (u1, u2) = common_prefix(p1.split(sep), p2.split(sep))
    if not common:
        return p2  # 如果完全没有共同元素, 则路径是绝对路径
    return sep.join( [pardir] * len(u1) + u2 )
    
def test(p1, p2, sep=os.path.sep):
    ''' 调用relpath函数, 打印调用参数和结果 '''
    print "from", p1, "to", p2, " -> ", relpath(p1, p2, sep)
    
if __name__ == '__main__':
    test('a/b/c/d', '/a/b/c1/d1/', '/')
    test('a/b/c/d', '/a/b/c/d/', '/')
    test('c:/x/y/z', 'd:/x/y/z', '/')
    