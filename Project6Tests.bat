:: test words with dup letters
:: cap letters
:: guess whole word
copy /y "wordlist_premade3.txt" "wordlist.txt"
python Project6.py < "Project6Test1.txt"

:: different words same n
:: play again invalid
:: invalid n
:: invalid guess
:: dup guesses, words and letters
copy /y "wordlist_premade.txt" "wordlist.txt"
python Project6.py < "Project6Test2.txt"
