$KCODE = "u"
require "jcode"

mb = "2\303\2272=4"
puts mb.length
puts mb.jlength
puts mb.mbchar?

mb.each_byte { |c| print c }
puts "\n"
mb.each_char { |c| print c }
