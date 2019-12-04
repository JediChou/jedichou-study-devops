def words_of_file(filepath, line_to_words=str.split):
    the_file = open(filepath)
    for line in the_file:
        for word in line_to_words(line):
            yield word
    the_file.close()
    
count = 0
for word in words_of_file('data'):
    count += 1

print count