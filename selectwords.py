import random

f = open("words_alpha.txt", 'r')
words = f.read().split()
f.close()
random.shuffle(words)
words = words[:30]
words = '\n'.join(words)
o = open("wordlist.txt", 'w')
o.write(words)
o.close()
