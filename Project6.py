# Eric Foy

# When executed, your program should look for the file wordlist.txt in the same
# directory as your main program script. It should load the list of possible
# words from this file. If this file is not present, your program should exit
# gracefully.
words = []
try:
    f = open('wordlist.txt', 'r')
    words = f.read().split()
    f.close()
except FileNotFoundError:
    print('wordlist.txt not found')
    exit()

# A reasonable way to organize your data would be a dictionary(hash) where each
# key is a number n, and each value is a list of words with length n letters. 
allWords = {}
for i in words:
    if len(i) in allWords.keys():
        allWords[len(i)] += [i]
    else:
        allWords[len(i)] = [i]

# Your game should be playable for any number of letters from 3 to the number
# of letters in the longest word in the text file.
maxn = max(allWords.keys())
playing = True
while playing:
    print('Welcome to Hangman')
    n = input('What length word would you like to play? (3 to {}) '.format(maxn))
    while not n.isdigit() or not int(n) in allWords.keys():
        n = input('Thats not a valid, what length would you like? ')

    # Each time your game is played, it should randomly select a word of the
    # appropriate length.  Playing the game repeatedly with the same number of
    # letters should not result in the same word being repeatedly chosen.
    possibleWords = allWords[int(n)]
    word = possibleWords[0]
    possibleWords = possibleWords[1:] + [word]
    dispWord = '*' * int(n)

    # Number of guesses for a word of length n is (2n -1)
    guesses = 2 * int(n) - 1
    prevGuesses = []

    # The user wins when they correctly guess the word, or all the letters in
    # the word have been guessed. The user loses if they have no more guesses
    # remaining and they have not yet won
    while guesses > 0 and dispWord != word:
        print('')
        print('Word: {}'.format(dispWord))
        print('You have {} guesses remaining.'.format(guesses))
        guess = input('Type a letter or a word guess: ')

        # Any input of length 2 or more than n, the program should re-prompt the
        # user.
        while not guess.isalpha() or len(guess) == 2 or len(guess) > maxn:
            guess = input('Thats not valid, type a letter or word: ')

        if guess in prevGuesses:
            print('you guessed {} before!'.format(guess))
        else:
            prevGuesses += [guess]
            guesses -= 1

            # When prompted for a letter or word guess, any input of length 1
            # should be treated as a letter. Any input of length 3 or more should
            # be treated as a word guess (upper or lower case)
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
    print('')

    again = input('Would you like to play again? ')
    while not again in ['yes', 'Yes', 'no', 'No']:
        again = input('Thats not a valid, play again? ')

    if again == 'no' or again == 'No':
        playing = False
