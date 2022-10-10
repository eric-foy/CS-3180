(define faces '(2 3 4 5 6 7 8 9 10 J Q K A))
(define suits '(Clubs Diamonds Hearts Spades))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; make-deck
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(display "make-deck") (newline)
(length (make-deck))
(display " = 52") (newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; eval-hand
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; TODO test every possible hand :) 
; 52C2 + 52C3 + 52C4 + ... + 52C52

(define card1 (cons 'J 'Diamonds))
(define card2 (cons 9 'Spades))
(define card3 (cons 'A 'Hearts))
(define card4 (cons 'A 'Clubs))
(define card5 (cons 2 'Diamonds))
(define card6 (cons 5 'Spades))
(define card7 (cons 10 'Hearts))
(define card8 (cons 'K 'Clubs))
(define card9 (cons 7 'Diamonds))
(define card10 (cons 'A 'Diamonds))
(define card11 (cons 'A 'Spades))

(display "ace as 1") (newline)
(eval-hand (list card1 card2 card3))
(display " = 20") (newline)
(eval-hand (list card1 card3 card2))
(display " = 20") (newline)
(eval-hand (list card2 card1 card3))
(display " = 20") (newline)
(eval-hand (list card2 card3 card1))
(display " = 20") (newline)
(eval-hand (list card3 card1 card2))
(display " = 20") (newline)
(eval-hand (list card3 card2 card1))
(display " = 20") (newline)

(display "ace as 11") (newline)
(eval-hand (list card2 card3))
(display " = 20") (newline)
(eval-hand (list card3 card2))
(display " = 20") (newline)

(display "blackjack") (newline)
(eval-hand (list card1 card3))
(display " = 21") (newline)
(eval-hand (list card3 card1))
(display " = 21") (newline)

(display "one ace 11 one ace 1") (newline)
(eval-hand (list card5 card3 card4))
(display " = 14") (newline)
(eval-hand (list card5 card4 card3))
(display " = 14") (newline)
(eval-hand (list card4 card5 card3))
(display " = 14") (newline)
(eval-hand (list card4 card3 card5))
(display " = 14") (newline)
(eval-hand (list card3 card4 card5))
(display " = 14") (newline)
(eval-hand (list card3 card5 card4))
(display " = 14") (newline)

(display "three aces") (newline)
(eval-hand (list card4 card3 card10))
(display " = 13") (newline)

(display "four aces") (newline)
(eval-hand (list card4 card3 card10 card11))
(display " = 14") (newline)

(display "should have called blackjack") (newline)
(eval-hand (list card7 card3 card10))
(display " = 12") (newline)
(eval-hand (list card7 card10 card3))
(display " = 12") (newline)
(eval-hand (list card10 card7 card3))
(display " = 12") (newline)
(eval-hand (list card10 card3 card7))
(display " = 12") (newline)
(eval-hand (list card3 card10 card7))
(display " = 12") (newline)
(eval-hand (list card3 card7 card10))
(display " = 12") (newline)

(display "three aces as 1") (newline)
(eval-hand (list card1 card3 card4 card10))
(display " = 13") (newline)

(display "four aces as 1") (newline)
(eval-hand (list card1 card3 card4 card10 card11))
(display " = 14") (newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; deal!
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define thedeck (shuffle (make-deck)))

(display "from 52 cards") (newline)
(length (deal! thedeck))
(display " = 2") (newline)

(display "from 50 cards") (newline)
(length (deal! thedeck))
(display " = 2") (newline)

(display "returns list") (newline)
(list? (deal! thedeck))
(display " = #t") (newline)

(display "returns list of pairs") (newline)
(pair? (car (deal! thedeck)))
(display " = #t") (newline)

(display "from 1 card") (newline)
(length (deal! (list (cons '3 'Diamonds))))
(display " = 0") (newline)

(display "from 0 card") (newline)
(length (deal! (list)))
(display " = 0") (newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; hit!
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define playerhand (deal! thedeck))
(define dealerhand (deal! thedeck))

(display "into 2 cards") (newline)
(define deckcount (length thedeck))
(hit! thedeck "player")
(length playerhand)
(display " = 3") (newline)
(- deckcount (length thedeck))
(display " = 1") (newline)

(display "into 3 cards") (newline)
(hit! thedeck "player")
(length playerhand)
(display " = 4") (newline)

(display "into 2 cards dealer") (newline)
(define deckcount (length thedeck))
(hit! thedeck "dealer")
(length dealerhand)
(display " = 3") (newline)
(- deckcount (length thedeck))
(display " = 1") (newline)

(display "deal into not valid") (newline)
(define deckcount (length thedeck))
(hit! thedeck "me")
(display " = only player and dealer supported") (newline)
(- deckcount (length thedeck))
(display " = 0") (newline)

(display "from 1 card") (newline)
(hit! (list (cons '3 'Diamonds)) "player")
(length playerhand)
(display " = 5") (newline)

(display "from 0 card") (newline)
(hit! (list) "player")
(display " = Not one card in deck to hit from") (newline)
