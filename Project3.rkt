#lang racket
; Eric Foy

(define faces '(2 3 4 5 6 7 8 9 10 J Q K A))
(define suits '(Clubs Diamonds Hearts Spades))

(define card1 (cons 'J 'Diamonds))
(define card2 (cons 9 'Spades))

(define make-card
  (lambda (face suit)
    (cons face suit)))

(define hand1 (list (make-card 'A 'Clubs)
                    (make-card 8 'Spades)
                    (make-card 2 'Diamonds)))

; make-deck (10 pts) -- Creates a new (unshuffled) 52 card deck
; Parameters: none
; Returns: The deck (a list of cards)
; Notes: Depends on the global definitions of faces and suits.
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

; eval-hand (10 pts) -- Determine the best value of a hand, given that an Ace can be worth either 1 or 11 points.
; Parameter: hand -- A list of cards to evaluate
; Returns: The best possible value of the hand
; Example: (display (eval-hand playerhand))

; deal! (10 pts) -- Create a two card hand, by removing the top two cards from the deck.
; Parameter: deck -- The deck to deal from
; Returns: A new two-card hand, consisting of the first two cards in the deck.
; Side effects: The first two cards are removed from the deck. (You may choose to use a macro to do this)
; Example: (define playerhand (deal thedeck))

; hit! (5 pts) -- Take the top card from the deck and add it to a hand.
; Parameter 1: deck -- The deck to deal from
; Parameter 2: hand -- The hand to deal into
; Returns: Nothing of interest
; Side effects: The first card in the deck is removed from the deck and added to the hand.
; Example: (hit! thedeck dealerhand)

; show-hand (5 pts) -- Display a hand (or most of it) to the screen.
; Parameter 1: hand -- The hand to display
; Parameter 2: how -- Should be either 'Full or 'Part. If how is 'Full, then show the entire hand. If how is 'Part, then show only ***** for the first card, and then show the rest of the hand normally.
; Parameter 3: description -- A string to be displayed to the screen before the actual hand.
; Returns: Nothing of interest
; Side effects: The hand is displayed to the screen
; Example: (show-hand dealerhand 'Part "The dealer has: ")
