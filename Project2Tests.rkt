;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; set-equal?
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; from handout
; #t
(set-equal? '(1 2 3 4) '(4 2 1 3))
(display " = #t")
(newline)

; uneven lists
; #f
(set-equal? '(1 2 3) '(1 2 3 4))
(display " = #f")
(newline)
(set-equal? '(1 2 3 4) '(1 2 3))
(display " = #f")
(newline)

; uneven but dups
; #t
(set-equal? '(1 2 3) '(1 2 3 3))
(display " = #t")
(newline)
(set-equal? '(1 2 3 3) '(1 2 3))
(display " = #t")
(newline)

; equal same order
; #t
(set-equal? '(1 2 3 4) '(1 2 3 4))
(display " = #t")
(newline)

; equal big numbers
; #t
(set-equal? '(111111 222222 333333) '(111111 222222 333333))
(display " = #t")
(newline)

; not equal first pos
; f
(set-equal? '(1 2 3) '(5 1 2))
(display " = #f")
(newline)
(set-equal? '(5 1 2) '(1 2 3))
(display " = #f")
(newline)

; not equal second pos
; f
(set-equal? '(1 2 3) '(1 5 2))
(display " = #f")
(newline)
(set-equal? '(1 5 2) '(1 2 3))
(display " = #f")
(newline)

; not equal last pos
; f
(set-equal? '(1 2 3 4 5 6 7) '(1 2 3 4 5 6 8))
(display " = #f")
(newline)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; nested-set-equal?
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; from handout
(nested-set-equal? '(1 2 (3 4 5)) '(2 (4 3 5) 1))
(display " = #t")
(newline)

; from handout
; #t
(nested-set-equal? '(1 2 3 4) '(4 2 1 3))
(display " = #t")
(newline)

; uneven lists
; #f
(nested-set-equal? '(1 2 3) '(1 2 3 4))
(display " = #f")
(newline)
(nested-set-equal? '(1 2 3 4) '(1 2 3))
(display " = #f")
(newline)

; uneven but dups
; #t
(nested-set-equal? '(1 2 3) '(1 2 3 3))
(display " = #t")
(newline)
(nested-set-equal? '(1 2 3 3) '(1 2 3))
(display " = #t")
(newline)

; equal same order
; #t
(nested-set-equal? '(1 2 3 4) '(1 2 3 4))
(display " = #t")
(newline)

; equal big numbers
; #t
(nested-set-equal? '(111111 222222 333333) '(111111 222222 333333))
(display " = #t")
(newline)

; not equal first pos
; f
(nested-set-equal? '(1 2 3) '(5 1 2))
(display " = #f")
(newline)
(nested-set-equal? '(5 1 2) '(1 2 3))
(display " = #f")
(newline)

; not equal second pos
; f
(nested-set-equal? '(1 2 3) '(1 5 2))
(display " = #f")
(newline)
(nested-set-equal? '(1 5 2) '(1 2 3))
(display " = #f")
(newline)

; not equal last pos
; f
(nested-set-equal? '(1 2 3 4 5 6 7) '(1 2 3 4 5 6 8))
(display " = #f")
(newline)

; nested not equal first pos first pos
(nested-set-equal? '((1 2 3) 3 4) '(3 4 (5 1 2)))
(display " = #f")
(newline)
(nested-set-equal? '((5 1 2) 3 4) '(3 4 (1 2 3)))
(display " = #f")
(newline)
(nested-set-equal? '(3 4 (1 2 3)) '((5 1 2) 3 4))
(display " = #f")
(newline)
(nested-set-equal? '(3 4 (5 1 2)) '((1 2 3) 3 4))
(display " = #f")
(newline)

; nested not equal first pos second pos
(nested-set-equal? '((1 2 3) 3 4) '(3 4 (1 5 2)))
(display " = #f")
(newline)
(nested-set-equal? '((1 5 2) 3 4) '(3 4 (1 2 3)))
(display " = #f")
(newline)
(nested-set-equal? '(3 4 (1 2 3)) '((1 5 2) 3 4))
(display " = #f")
(newline)
(nested-set-equal? '(3 4 (1 5 2)) '((1 2 3) 3 4))
(display " = #f")
(newline)

; nested not equal first pos last pos
(nested-set-equal? '((1 2 3 4 5 6 7) 3 4) '(3 4 (1 2 3 4 5 6 8)))
(display " = #f")
(newline)
(nested-set-equal? '((1 2 3 4 5 6 8) 3 4) '(3 4 (1 2 3 4 5 6 7)))
(display " = #f")
(newline)
(nested-set-equal? '(3 4 (1 2 3 4 5 6 7)) '((1 2 3 4 5 6 8) 3 4))
(display " = #f")
(newline)
(nested-set-equal? '(3 4 (1 2 3 4 5 6 8)) '((1 2 3 4 5 6 7) 3 4))
(display " = #f")
(newline)

; nested not equal second pos first pos
(nested-set-equal? '(3 (1 2 3) 4 5) '(3 4 5 (5 1 2)))
(display " = #f")
(newline)
(nested-set-equal? '(3 (5 1 2) 4 5) '(3 4 5 (1 2 3)))
(display " = #f")
(newline)
(nested-set-equal? '(3 4 5 (1 2 3)) '(3 (5 1 2) 4 5))
(display " = #f")
(newline)
(nested-set-equal? '(3 4 5 (5 1 2)) '(3 (1 2 3) 4 5))
(display " = #f")
(newline)

; nested not equal second pos second pos
(nested-set-equal? '(3 (1 2 3) 4 5) '(3 4 5 (1 5 2)))
(display " = #f")
(newline)
(nested-set-equal? '(3 (1 5 2) 4 5) '(3 4 5 (1 2 3)))
(display " = #f")
(newline)
(nested-set-equal? '(3 4 5 (1 2 3)) '(3 (1 5 2) 4 5))
(display " = #f")
(newline)
(nested-set-equal? '(3 4 5 (1 5 2)) '(3 (1 2 3) 4 5))
(display " = #f")
(newline)

; nested not equal second pos last pos
(nested-set-equal? '(3 (1 2 3 4 5 6 7) 4 5) '(3 4 5 (1 2 3 4 5 6 8)))
(display " = #f")
(newline)
(nested-set-equal? '(3 (1 2 3 4 5 6 8) 4 5) '(3 4 5 (1 2 3 4 5 6 7)))
(display " = #f")
(newline)
(nested-set-equal? '(3 4 5 (1 2 3 4 5 6 7)) '(3 (1 2 3 4 5 6 8) 4 5))
(display " = #f")
(newline)
(nested-set-equal? '(3 4 5 (1 2 3 4 5 6 8)) '(3 (1 2 3 4 5 6 7) 4 5))
(display " = #f")
(newline)

; nested not equal last pos first pos
(nested-set-equal? '(3 4 5 (1 2 3)) '(3 4 5 (5 1 2)))
(display " = #f")
(newline)
(nested-set-equal? '(3 4 5 (5 1 2)) '(3 4 5 (1 2 3)))
(display " = #f")
(newline)

; nested not equal last pos second pos
(nested-set-equal? '(3 4 5 (1 2 3)) '(3 4 5 (1 5 2)))
(display " = #f")
(newline)
(nested-set-equal? '(3 4 5 (1 5 2)) '(3 4 5 (1 2 3)))
(display " = #f")
(newline)

; nested not equal last pos last pos
(nested-set-equal? '(3 4 5 (1 2 3 4 5 6 7)) '(3 4 5 (1 2 3 4 5 6 8)))
(display " = #f")
(newline)
(nested-set-equal? '(3 4 5 (1 2 3 4 5 6 8)) '(3 4 5 (1 2 3 4 5 6 7)))
(display " = #f")
(newline)

; nested equal first pos same order
(nested-set-equal? '((1 2 3) 3 4 5) '((1 2 3) 3 4 5))
(display " = #t")
(newline)
; nested equal first pos diff order
(nested-set-equal? '((1 2 3) 3 4 5) '((3 2 1) 3 4 5))
(display " = #t")
(newline)

; nested equal second pos same order
(nested-set-equal? '(3 (1 2 3) 4 5) '(3 (1 2 3) 4 5))
(display " = #t")
(newline)
; nested equal second pos diff order
(nested-set-equal? '(3 (1 2 3) 4 5) '(3 (3 2 1) 4 5))
(display " = #t")
(newline)

; nested equal last pos same order
(nested-set-equal? '(3 4 5 (1 2 3)) '(3 4 5 (1 2 3)))
(display " = #t")
(newline)
; nested equal last pos diff order
(nested-set-equal? '(3 4 5 (1 2 3)) '(3 4 5 (3 2 1)))
(display " = #t")
(newline)

; not equal with nested equal 
(nested-set-equal? '((1 2 3) 3 4 5) '((1 2 3) 3 4 6))
(display " = #f")
(newline)

; double nested
(nested-set-equal? '(3 (1 2 (9 8)) 4 5) '(3 (1 2 (9 8)) 4 5))
(display " = #t")
(newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; union
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(display "from handout") (newline)
(union '(1 2 3 4) '(2 3 4 5))
(display " = (1 2 3 4 5)") (newline)

(display "equal length, no dups, sorted, not sparce") (newline)
(union '(1 2 3 4) '(5 6 7 8))
(display " = (1 2 3 4 5 6 7 8") (newline)
(union '(5 6 7 8) '(1 2 3 4))
(display " = (1 2 3 4 5 6 7 8") (newline)

(display "equal length, no dups, sorted, sparce") (newline)
(union '(1 4 6 7) '(2 3 5 8))
(display " = (1 2 3 4 5 6 7 8") (newline)
(union '(2 3 5 8) '(1 4 6 7))
(display " = (1 2 3 4 5 6 7 8") (newline)

(display "equal length, no dups, not sorted, not sparce") (newline)
(union '(3 2 1 4) '(7 8 5 6))
(display " = (1 2 3 4 5 6 7 8") (newline)
(union '(7 8 5 6) '(3 2 1 4))
(display " = (1 2 3 4 5 6 7 8") (newline)

(display "equal length, no dups, not sorted, sparce") (newline)
(union '(8 3 2 5) '(1 4 7 6))
(display " = (1 2 3 4 5 6 7 8") (newline)
(union '(1 4 7 6) '(8 3 2 5))
(display " = (1 2 3 4 5 6 7 8") (newline)

(display "equal length, dups, sorted, not sparce") (newline)
(union '(1 2 2 3) '(4 4 5 6))
(display " = (1 2 3 4 5 6") (newline)
(union '(4 4 5 6) '(1 2 2 3))
(display " = (1 2 3 4 5 6") (newline)

(display "equal length, dups, sorted, sparce") (newline)
(union '(1 4 5 5) '(2 3 3 6))
(display " = (1 2 3 4 5 6") (newline)
(union '(2 3 3 6) '(1 4 5 5))
(display " = (1 2 3 4 5 6") (newline)

(display "equal length, dups, not sorted, not sparce") (newline)
(union '(3 2 1 2) '(5 5 6 4))
(display " = (1 2 3 4 5 6") (newline)
(union '(5 5 6 4) '(3 2 1 2))
(display " = (1 2 3 4 5 6") (newline)

(display "equal length, dups, not sorted, sparce") (newline)
(union '(5 1 4 5) '(3 2 3 6))
(display " = (1 2 3 4 5 6") (newline)
(union '(3 2 3 6) '(5 1 4 5))
(display " = (1 2 3 4 5 6") (newline)

(display "not equal length, no dups, sorted, not sparce") (newline)
(union '(1 2 3) '(4 5 6 7 8 9))
(display " = (1 2 3 4 5 6 7 8 9") (newline)
(union '(4 5 6 7 8 9) '(1 2 3))
(display " = (1 2 3 4 5 6 7 8 9") (newline)

(display "not equal length, no dups, sorted, sparce") (newline)
(union '(1 5 6) '(2 3 4 7 8 9))
(display " = (1 2 3 4 5 6 7 8 9") (newline)
(union '(2 3 4 7 8 9) '(1 5 6))
(display " = (1 2 3 4 5 6 7 8 9") (newline)

(display "not equal length, no dups, not sorted, not sparce") (newline)
(union '(3 1 2) '(7 8 4 6 5 9))
(display " = (1 2 3 4 5 6 7 8 9") (newline)
(union '(7 8 4 6 5 9) '(3 1 2))
(display " = (1 2 3 4 5 6 7 8 9") (newline)

(display "not equal length, no dups, not sorted, sparce") (newline)
(union '(5 6 1) '(4 2 7 3 9 8))
(display " = (1 2 3 4 5 6 7 8 9") (newline)
(union '(4 2 7 3 9 8) '(5 6 1))
(display " = (1 2 3 4 5 6 7 8 9") (newline)

(display "not equal length, dups, sorted, not sparce") (newline)
(union '(1 2 2) '(3 4 5 6 6 7))
(display " = (1 2 3 4 5 6 7") (newline)
(union '(3 4 5 6 6 7) '(1 2 2))
(display " = (1 2 3 4 5 6 7") (newline)

(display "not equal length, dups, sorted, sparce") (newline)
(union '(1 4 4) '(2 3 5 5 6 7))
(display " = (1 2 3 4 5 6 7") (newline)
(union '(2 3 5 5 6 7) '(1 4 4))
(display " = (1 2 3 4 5 6 7") (newline)

(display "not equal length, dups, not sorted, not sparce") (newline)
(union '(2 1 2) '(4 3 6 6 5 7))
(display " = (1 2 3 4 5 6 7") (newline)
(union '(4 3 6 6 5 7) '(2 1 2))
(display " = (1 2 3 4 5 6 7") (newline)

(display "not equal length, dups, not sorted, sparce") (newline)
(union '(4 1 4) '(3 2 5 5 7 6))
(display " = (1 2 3 4 5 6 7") (newline)
(union '(3 2 5 5 7 6) '(4 1 4))
(display " = (1 2 3 4 5 6 7") (newline)
