; from handout
; #t
(set-equal? '(1 2 3 4) '(4 2 1 3))

; uneven lists
; #f
(set-equal? '(1 2 3) '(1 2 3 4))
(set-equal? '(1 2 3 4) '(1 2 3))

; uneven but dups
; #t
(set-equal? '(1 2 3) '(1 2 3 3))
(set-equal? '(1 2 3 3) '(1 2 3))

; equal same order
; #t
(set-equal? '(1 2 3 4) '(1 2 3 4))

; equal big numbers
; #t
(set-equal? '(111111 222222 333333) '(111111 222222 333333))

; not equal first pos
; f
(set-equal? '(1 2 3) '(5 1 2))
(set-equal? '(5 1 2) '(1 2 3))

; not equal second pos
; f
(set-equal? '(1 2 3) '(1 5 2))
(set-equal? '(1 5 2) '(1 2 3))

; not equal last pos
; f
(set-equal? '(1 2 3 4 5 6 7) '(1 2 3 4 5 6 8))
