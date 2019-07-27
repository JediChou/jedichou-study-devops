# reversting string by words.
astring = "Hi girls. You are a hot babe, can you play with me"
rewords = astring.split()
rewords.reverse()
rewords = ' '.join(rewords)
print rewords

# shot reversting
print ' '.join(astring.split()[::-1])
