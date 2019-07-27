# program: case_class.rb
array = [ "aa", 1, nil ]
item = array[0]
case item
    when String
        puts "item is a String."
    when Numeric
        puts "item is a numberic."
    else
        puts "item is a something."
end
