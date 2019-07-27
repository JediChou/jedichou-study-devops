# -*- coding: utf-8 -*-
"""
@file  : udtest.py
@create: 2012-8-10
@author: Jedi Chou
@version    : 0.03
@description:
  create a set of files for test iTEC udisk.
  Modify to test storage devices
  Add multi thread to generate txt files.

@os platform: Windows XP
@py platform 1: Python 2.6.6
@py platform 2: (r266:84297, Aug 24 2010, 18:46:32)
@py platform 3: [MSC v.1500 32 bit (Intel)] on win32
"""
import os
import time
import random
import threading

class filegen(threading.Thread):
    
    def __init__(self, num, size):
        threading.Thread.__init__(self)
        self.filenums = num
        self.kb = 1024
        self.mb = 1048576
        self.gb = 1073741824
        self.filesize = size*1024

    def run(self):
        global mutex,count,path_00
        threadname = threading.currentThread().getName()
       
        for counter in range(0, self.filenums):
            target = path_00+str(random.randint(1,num))+"t\\" + threadname + "-" + str(counter) + '.txt'
            #print self.filesize # TODO: Bug
            #self.createFile(target, filesize)
            #print target
            #print threadname
            
            #Create files 
            fp = open(target,"w")
            fp.seek(self.filesize-1)
            fp.write(chr(random.randrange(65,90)))
            fp.close()
            pass

if __name__ == '__main__':
    # define variable
    global mutex
    global num,count

    #define the path to store the files
    path=raw_input("please input the path to the files,like c:\\abc\\ :")
    path_00=path
    
    threads = []
    count = 1
    mutex = threading.Lock()
    num=int(raw_input("input the threads you want to create,like 10 :")) #threads
    # Start test
    # create file director
    os.mkdir(path_00)
    for dirs in range(1,num+1):
        target_00 = path_00+str(dirs)+"t" #file path
        os.mkdir(target_00)
    file_counts=int(raw_input("please input the quantity of files,like 2000:"))
    print "the size of all the files is about ",num*file_counts,"K"
    all_start_time = time.time()
    #create threads objects
    for x in xrange(0, num):
        threads.append(filegen(file_counts, 1))#file counts, size(1M/1)
    #start threads
    for t in threads:
        t.daemon=True
        t.start()
    #wait for the thread to stop
    for t in threads:
        t.join()
            
    all_end_time = time.time()
    # End test

    print "All file generate time is: ", all_end_time - all_start_time
