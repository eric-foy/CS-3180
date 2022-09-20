#lang racket
;Eric Foy
;CS 3180  Comparative Languages
;Project #1  Warm-up with Racket Lists

;Part 1: (10 points): Using only the (cons ) function, write a Racket form that
;returns each of the pair constructs below:
;1. (1 2 3 4)
(cons 1 (cons 2 (cons 3 (cons 4 '()))))
;2. (1 (2 . 3) 4)
(cons 1 (cons (cons 2 3) (cons 4 '())))
;3. (1 2 (3 (4 . 5)))
(cons 1 (cons 2 (cons (cons 3 (cons (cons 4 5) '())) '())))
;4. (1 2 (3 4 5))
(cons 1 (cons 2 (cons (cons 3 (cons 4 (cons 5 '()))) '())))
;5. ((1 . 2) (3 . 4) . 5)
(cons (cons 1 2) (cons (cons 3 4) 5))

;Part 2: (10 points): Using only the (cons ) function, write a Racket form that
;returns the pair represented by each of the following box diagrams:
;6.
(cons 1 (cons 2 (cons 3 '())))
;7.
(cons 1 (cons 2 (cons 3 4)))
;8.
(cons 1 (cons 2 (cons (cons 3 4) (cons 5 6))))
;9.
(cons 1 (cons (cons '() 2) (cons 3 '())))
;10.
(cons (cons (cons 2 3) (cons 4 5)) (cons 6 7))

;Part 3: (10 points): write Racket functions:
;Write a function (avg3) that
;expects three numerical arguments and returns the average
(define avg3 (lambda (x y z) (/ (+ x y z) 3)))
;Write a function (third-item) that expects a list of arguments (any length >
;3) and returns the third item in the list
(define third-item (lambda (l) (car (cddr l))))
