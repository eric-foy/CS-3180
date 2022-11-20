:: test words with dup letters
copy /y "wordlist_premade3.txt" "wordlist.txt"
python Project6.py < "Project6Test1.txt"
python Project6.py < "Project6Test2.txt"
python Project6.py < "Project6Test3.txt"
python Project6.py < "Project6Test4.txt"

:: cap letters
python Project6.py < "Project6Test9.txt"
python Project6.py < "Project6Test10.txt"

:: guess whole word
python Project6.py < "Project6Test11.txt"

:: different words same n
copy /y "wordlist_premade.txt" "wordlist.txt"
python Project6.py < "Project6Test5.txt"
python Project6.py < "Project6Test5.txt"
python Project6.py < "Project6Test5.txt"

:: invalid n
python Project6.py < "Project6Test6.txt"

:: invalid guess
python Project6.py < "Project6Test7.txt"

:: dup guesses, words and letters
python Project6.py < "Project6Test8.txt"
