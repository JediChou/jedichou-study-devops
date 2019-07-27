#!/usr/bin/env python
'''
1.17�滻�ַ����е��Ӵ�
'''
#����һ���ַ�����ͨ����ѯһ���滻�ֵ䣬���ַ����б���ǵ����ַ����滻��
#ʹ��string.Template��ʵ��
import string
#���ַ�������ģ�壬���б�ʶ����$���
new_style = string.Template('this is $thing')
#��ģ���substitute��������һ���ֵ����������֮
print new_style.substitute({'thing':5})		#�����this is 5
print new_style.substitute({'thing':'test'})	#�����this is test
#���⣬Ҳ���Ը�substitute�������ݹؼ��ֲ���
print new_style.substitute(thing=5)		#�����this is 5
print new_style.substitute(thing='test')	#�����this is test

#����string.Templateʵ��ʱ�����ַ�����ʽ�У�������������Ԫ����$��������$,
#����������Щ��Ҫ���滻�ı�ʶ����ֱ�Ӹ��������滻���ı��������֣�����һ�Ի�
#���ţ�{}��������������������
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

#locals()���Դ���һ���ֵ䣬�ֵ��key���Ǳ��ر���
msg = string.Template('the square of $number is $square')
for number in range(10):
    square = number * number
    print msg.substitute(locals())

#ʹ�ùؼ��ֲ����﷨�����ֵ䣬ֱ�ӽ�ֵ����substitute
msg = string.Template('the square of $number is $square')
for i in range(10):
    print msg.substitute(number=i, square=i*i)

#����ͬʱ�����ֵ�͹ؼ��ֲ���

msg = string.Template('the square of $number is $square')
for number in range(10):
    print msg.substitute(locals(), square=number*number)

#Ϊ�˷�ֹ�ֵ����Ŀ�͹ؼ��ֲ�����ʽ���ݵ�ֵ������ͻ���ؼ��ֲ�������

msg = string.Template('an $adj $msg')
adj = 'interesting'
print msg.substitute(locals(), msg='message')
