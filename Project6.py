import random

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
while not n.isdigit() or not int(n) in allWords.keys():
    n = input('Thats not a valid, what length would you like? ')

possibleWords = allWords[int(n)]
word = random.choice(possibleWords)
dispWord = '*' * int(n)
guesses = 2 * int(n) - 1
prevGuesses = []

while guesses > 0 and dispWord != word:
    print('')
    print('Word: {}'.format(dispWord))
    print('You have {} guesses remaining.'.format(guesses))
    guess = input('Type a letter or a word guess: ')
    while not guess.isalpha() or len(guess) == 2 or len(guess) > maxn:
        guess = input('Thats not valid, type a letter or word: ')

    if not guess in prevGuesses:
        prevGuesses += guess
        guesses -= 1
        if len(guess) == 1:
            found = word.find(guess)
            if found == -1:
                print("Sorry, there are no {}'s".format(guess))
            else:
                dispList = list(dispWord)
                dispList[found] = word[found]
                dispWord = ''.join(dispList)
