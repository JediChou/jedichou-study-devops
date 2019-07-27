import re

def words_of_file(filepath, line_to_words=str.split):
    the_file = open(filepath)
    for line in the_file:
        for word in line_to_words(line):
            yield word
    the_file.close()

def words_by_re(filepath, repattern=r"[\w'-]+"):
    wre = re.compile(repattern)
    def line_to_words(line):
        for mo in wre.finditer(line):
            return mo.group(0)
    return words_of_file(filepath, line_to_words)
    
if __name__ == "__main__":

    """ TODO There has a bug need to fix """

    count = 0
    generate = words_by_re('data')
    
    try:
        while (True):
            print generate.next()
            count += 1
    except:
        print "Exception throws"
        
    print count
    