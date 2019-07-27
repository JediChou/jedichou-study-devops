# program 3.5, gets_text.rb
filename = ARGV[0]
file = open(filename)
while text = file.gets do
	print text
end
file.close
