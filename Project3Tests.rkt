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

