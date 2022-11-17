words = []
try:
    f = open('wordlist.txt', 'r')
    words = f.read().split()
    f.close()
except FileNotFoundError:
    print('wordlist.txt not found')
    exit()

allWords = {}
for i in words:
    if len(i) in allWords.keys():
        allWords[len(i)] += [i]
    else:
        allWords[len(i)] = [i]

maxn = max(allWords.keys())

print('Welcome to Hangman')
n = input('What length word would you like to play? (3 to {}) '.format(maxn))
while not n.isdigit():
    n = input('Thats not a number, what length would you like? ')
while not (int(n) in allWords.keys()):
    n = input('No words of length {}, what length would you like? '.format(n))
    while not n.isdigit():
        n = input('Thats not a number, what length would you like? ')

possibleWords = allWords[int(n)]
print(possibleWords)
