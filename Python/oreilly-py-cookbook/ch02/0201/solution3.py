# coding: utf-8

try:
    file_object = open('thefile.txt')
    try:
        
        # use read().splitlines() method
        # you will get a list object
        line_of_all_the_lines = file_object.read().splitlines()
        print type(line_of_all_the_lines)
        print '-------------------------'
        print line_of_all_the_lines
        print '-------------------------'
        
        # use read().split('\n')
        # you will get a list object, but it's content is not right
        line_of_all_the_lines = file_object.read().split('\n')
        print type(line_of_all_the_lines)
        print '-------------------------'
        print line_of_all_the_lines
        print '-------------------------'
        
        
    finally:
        file_object.close()
except:
    print 'Miss IO Exception. Program quit.'