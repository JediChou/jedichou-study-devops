# program 3.4 read_text.rb
filename = ARGV[0]
file = open(filename)
text = file.read
print text
file.close
