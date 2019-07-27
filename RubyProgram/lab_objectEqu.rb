# How to show object id (memory level)
ary1 = []
ary2 = []
p ary1.object_id
p ary2.object_id

# object same ?
str1 = "foo"
str2 = str1
str3 = "f"+"o"+"o"
p str1.equal?(str2)
p str1.equal?(str3)

# other sample
p 1.0 == 1
p 1.0.eql?1

