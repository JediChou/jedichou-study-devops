#!/usr/bin/env python
'''
1.17替换字符串中的子串
'''
#给定一个字符串，通过查询一个替换字典，将字符串中被标记的子字符串替换掉
#使用string.Template类实现
import string
#从字符串生成模板，其中标识符被$标记
new_style = string.Template('this is $thing')
#给模板的substitute方法传入一个字典参数并调用之
print new_style.substitute({'thing':5})		#输出：this is 5
print new_style.substitute({'thing':'test'})	#输出：this is test
#另外，也可以给substitute方法传递关键字参数
print new_style.substitute(thing=5)		#输出：this is 5
print new_style.substitute(thing='test')	#输出：this is test

#创建string.Template实例时，在字符串格式中，可以用两个美元符（$）来代表$,
#还可以让那些需要被替换的标识后面直接跟上用于替换的文本或者数字，并用一对花
#括号（{}）将它们括起来。如下
form_letter = """Dear $customer,
I hope you are having a great time.
If you do not find Room $room to your satisfaction,
let us know. Please accept this $$5 coupon.
	    sincerely
	    $manager
	    ${name}Inn"""
letter_template = string.Template(form_letter)
print letter_template.substitute({'name':'Sleepy', 'customer':'Fred Smith',
					'manager':'Barney Mills', 'room':307,
					    })

#locals()可以创建一个字典，字典的key就是本地变量
msg = string.Template('the square of $number is $square')
for number in range(10):
    square = number * number
    print msg.substitute(locals())

#使用关键字参数语法而非字典，直接将值传给substitute
msg = string.Template('the square of $number is $square')
for i in range(10):
    print msg.substitute(number=i, square=i*i)

#可以同时传递字典和关键字参数

msg = string.Template('the square of $number is $square')
for number in range(10):
    print msg.substitute(locals(), square=number*number)

#为了防止字典的条目和关键字参数显式传递的值发生冲突，关键字参数优先

msg = string.Template('an $adj $msg')
adj = 'interesting'
print msg.substitute(locals(), msg='message')
