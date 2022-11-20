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

    if guess in prevGuesses:
        print('you guessed {} before!'.format(guess))
    else:
        prevGuesses += [guess]
        guesses -= 1
        if len(guess) == 1:
            finds = []
            found = word.find(guess)
            while found != -1:
                finds += [found]
                found = word.find(guess, found + 1)

            if len(finds) == 0:
                print("Sorry, there are no {}'s".format(guess))
            elif len(finds) == 1:
                print('There is 1 {}!'.format(guess))
                dispList = list(dispWord)
                dispList[finds[0]] = guess
                dispWord = ''.join(dispList)
            else:
                print("There are {} {}'s!".format(len(finds), guess))
                for f in finds:
                    dispList = list(dispWord)
                    dispList[f] = guess
                    dispWord = ''.join(dispList)
        else:
            if guess == word:
                dispWord = guess
            else:
                print("Sorry, the word is not '{}'".format(guess))

if dispWord == word:
    print('Congratulations, you guessed it!')

print('Game over')
