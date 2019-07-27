import copy
source_list = [1,2,3,4,5]
target_list = copy.deepcopy(source_list)
print target_list
print source_list == target_list
