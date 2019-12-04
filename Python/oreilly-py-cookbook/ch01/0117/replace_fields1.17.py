#!/usr/bin/env python

import string

new_style = string.Template('this is $thing')

print new_style.substitute({'thing':5})
print new_style.substitute({'thing':'test'})

print new_style.substitute(thing=5)
print new_style.substitute(thing='test')

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

msg = string.Template('the square of $number is $square')
for number in range(10):
    square = number * number
    print msg.substitute(locals())

msg = string.Template('the square of $number is $square')
for i in range(10):
    print msg.substitute(number=i, square=i*i)

msg = string.Template('the square of $number is $square')
for number in range(10):
    print msg.substitute(locals(), square=number*number)

msg = string.Template('an $adj $msg')
adj = 'interesting'
print msg.substitute(locals(), msg='message')
