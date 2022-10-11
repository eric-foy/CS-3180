#lang racket
; Eric Foy

(define faces '(2 3 4 5 6 7 8 9 10 J Q K A))
(define suits '(Clubs Diamonds Hearts Spades))

; make-deck (10 pts) -- Creates a new (unshuffled) 52 card deck
; Parameters: none
; Returns: The deck (a list of cards)
; Notes: Depends on the global definitions of faces and suits.  Shuffle with
; (shuffle thedeck)
; Example: (define thedeck (make-deck))
(define make-deck
  (lambda ()
    (letrec ((main (lambda (s o)
                     (if (null? s) o
                       (main (cdr s) (main-aux (car s) faces o)))))
             (main-aux (lambda (s f o)
                         (if (null? f) o
                           (main-aux s (cdr f) (cons (cons (car f) s) o))))))
      (main suits '()))))

; eval-hand (10 pts) -- Determine the best value of a hand, given that an Ace
; can be worth either 1 or 11 points.
; Parameter: hand -- A list of cards to evaluate
; Returns: The best possible value of the hand
; Example: (display (eval-hand playerhand))
(define eval-hand
  (lambda (hand)
    (letrec ((main (lambda (h o a)
                     (if (null? h)
                       (avalue a o)
                       (main
                         (cdr h)
                         (hvalue (car (car h)) o)
                         (acount (car (car h)) a)))))
             (hvalue (lambda (c o)
                       (case c
                         ((2) (+ 2 o))
                         ((3) (+ 3 o))
                         ((4) (+ 4 o))
                         ((5) (+ 5 o))
                         ((6) (+ 6 o))
                         ((7) (+ 7 o))
                         ((8) (+ 8 o))
                         ((9) (+ 9 o))
                         ((10) (+ 10 o))
                         ((J) (+ 10 o))
                         ((Q) (+ 10 o))
                         ((K) (+ 10 o))
                         ((A) o)
                         (else (display "error in face value")))))
             (acount (lambda (c a)
                       (if (equal? c 'A) (+ a 1) a)))
             (avalue (lambda (a o)
                       (case a
                         ((0) o)
                         ((1) (if (> (+ o 11) 21)
                                (+ o 1)
                                (+ o 11)))
                         ((2) (if (> (+ o 12) 21)
                                (+ o 2)
                                (+ o 12)))
                         ((3) (if (> (+ o 13) 21)
                                (+ o 3)
                                (+ o 13)))
                         ((4) (if (> (+ o 14) 21)
                                (+ o 4)
                                (+ o 14)))
                         (else (display "more than 4 aces in deck"))))))
      (main hand 0 0))))

; deal! (10 pts) -- Create a two card hand, by removing the top two cards from
; the deck.
; Parameter: deck -- The deck to deal from
; Returns: A new two-card hand, consisting of the first two cards in the deck.
; Side effects: The first two cards are removed from the deck. (You may choose
; to use a macro to do this)
; Example: (define playerhand (deal thedeck))
(define deal!
  (lambda (deck)
    (if (>= (length deck) 2)
      (let ((hand (list (car deck) (cadr deck))))
        (set! thedeck (cddr deck))
        hand)
      (begin
        (display "Not two cards in deck to make a hand from") (newline)
        (list)))))

; hit! (5 pts) -- Take the top card from the deck and add it to a hand.
; Parameter 1: deck -- The deck to deal from
; Parameter 2: hand -- The hand to deal into
; Returns: Nothing of interest
; Side effects: The first card in the deck is removed from the deck and added
; to the hand.
; Example: (hit! thedeck dealerhand)
(define hit!
  (lambda (deck hand)
    (if (>= (length deck) 1)
      (case hand
        (("player")
         (set! playerhand (cons (car deck) playerhand))
         (set! thedeck (cdr deck)))
        (("dealer")
         (set! dealerhand (cons (car deck) dealerhand))
         (set! thedeck (cdr deck)))
        (else
          (display "only player and dealer supported")
          (newline)))
      (begin
        (display "Not one card in deck to hit from")
        (newline)))))

; show-hand (5 pts) -- Display a hand (or most of it) to the screen.
; Parameter 1: hand -- The hand to display
; Parameter 2: how -- Should be either 'Full or 'Part. If how is 'Full, then
; show the entire hand. If how is 'Part, then show only ***** for the first
; card, and then show the rest of the hand normally.
; Parameter 3: description -- A string to be displayed to the screen before the
; actual hand.
; Returns: Nothing of interest
; Side effects: The hand is displayed to the screen
; Example: (show-hand dealerhand 'Part "The dealer has: ")
(define show-hand
  (lambda (hand how description)
    (display description)
    (case how
      (("full")
       (display hand)
       (newline))
      (("part")
       (display (cons '(*****) (cdr hand)))
       (newline))
      (else
        (display "only full and part supported")
        (newline)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; main
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define quota 100000)
(display "you have $") (display quota) (newline)
(display "do you want to play blackjack? yes or no: ")
(if (char=? (string-ref (read-line) 0) #\y)
  (begin
    (define thedeck (shuffle (make-deck)))
    (define playerhand (deal! thedeck))
    (define dealerhand (deal! thedeck))
    )
  'goodbye)

(if (< (eval-hand dealerhand) 17) 'hit 'hold)
