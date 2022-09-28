#lang racket
; Eric Foy

; set-equal? - Expects two lists, each of which represents a set of integers
; Two sets are equal if they contain the same members, ignoring the order.
; Assuming that the sets contain no duplicate values, and no recursive subsets.
; Returns: (boolean) #t if the sets are equal, #f otherwise.
; Parameters:
; set1 (list) - set of integers
; set2 (list) - set of integers
(define set-equal?
    (lambda (set1 set2)
      (letrec ((loop1 (lambda (set1sub set2big)
                 (if (null? set1sub) #t
                   (loop2 set1sub set2big set2big))))
               (loop2 (lambda (set1sub set2sub set2big)
                 (if (null? set2sub) #f
                   (if (= (car set1sub) (car set2sub))
                     (loop1 (cdr set1sub) set2big)
                     (loop2 set1sub (cdr set2sub) set2big))))))
              (let ((a (loop1 set1 set2))
                    (b (loop1 set2 set1)))
                (if (eqv? a b) a #f)))))

; nested-set-equal? - Identical to set-equal, but the sets can contain other
; sets. Sets made up of numbers and lists of numbers, So assuming if an element
; of a set is not a number then it is a list.
; Returns: (boolean) #t if the sets, containing nested sets, are equal, #f
; otherwise.
; Parameters:
; set1 (list) - set containing integers and sets of integers
; set2 (list) - set containing integers and sets of integers
(define nested-set-equal?
    (lambda (set1 set2)
      (letrec ((loop1 (lambda (set1sub set2big)
                 (if (null? set1sub) #t
                   (loop2 set1sub set2big set2big))))
               (loop2 (lambda (set1sub set2sub set2big)
                 (if (null? set2sub) #f
                   (if (number? (car set1sub))
                     (if (number? (car set2sub))
                       (if (= (car set1sub) (car set2sub))
                         (loop1 (cdr set1sub) set2big)
                         (loop2 set1sub (cdr set2sub) set2big))
                       (loop2 set1sub (cdr set2sub) set2big))
                     (if (number? (car set2sub))
                       (loop2 set1sub (cdr set2sub) set2big)
                       (let ((c (loop1 (car set1sub) (car set2sub)))
                             (d (loop1 (car set2sub) (car set1sub))))
                         (if (eqv? c d)
                           (if (eqv? c #t)
                             (loop1 (cdr set1sub) set2big)
                             #f)
                           #f))))))))
              (let ((a (loop1 set1 set2))
                    (b (loop1 set2 set1)))
                (if (eqv? a b) a #f)))))

; union - Expects two lists, each of which represents a set of integers.  The
; union of two sets contains every element from either of the two sets, with no
; repetitions.
; Returns: (list) The union of the two sets.
; Parameters:
; set1 (list) - set of integers
; set2 (list) - set of integers
(define union
  (lambda (set1 set2)
    (letrec ((loop (lambda (set1 o)
                     (if (null? set1) (prune (sort o <) '())
                       (loop (cdr set1) (cons (car set1) o)))))
             (prune (lambda (l o)
                      (if (null? (cdr l))
                        (list-rev (cons (car l) o) '())
                        (if (= (car l) (car (cdr l)))
                          (prune (cdr l) o)
                          (prune (cdr l) (cons (car l) o))))))
             (list-rev (lambda (l o)
                   (if (null? l) o
                     (list-rev (cdr l) (cons (car l) o))))))
      (if (equal? set1 '()) set2
        (if (equal? set2 '()) set1
          (loop set1 set2))))))

; intersection - Expects two lists, each of which represents a set of integers.
; The intersection of two sets contains every element that is present in both
; sets, with no repetitions
; Returns: (list) The intersection of the two sets.
; Parameters:
; set1 (list) - set of integers
; set2 (list) - set of integers
(define intersection
  (lambda (set1 set2)
    (letrec ((main (lambda (a b)
                     (merge
                       (prune (sort a <) '())
                       (prune (sort b <) '()))))
             (merge (lambda (set1 o)
                     (if (null? set1) (rprune (sort o <) '())
                       (merge (cdr set1) (cons (car set1) o)))))
             (prune (lambda (l o)
                      (if (null? (cdr l))
                        (cons (car l) o)
                        (if (= (car l) (car (cdr l)))
                          (prune (cdr l) o)
                          (prune (cdr l) (cons (car l) o))))))
             (rprune (lambda (l o)
                      (if (null? (cdr l))
                        (list-rev o '())
                        (if (= (car l) (car (cdr l)))
                          (rprune (cdr l) (cons (car l) o))
                          (rprune (cdr l) o)))))
             (list-rev (lambda (l o)
                   (if (null? l) o
                     (list-rev (cdr l) (cons (car l) o))))))
      (if (null? set1) '()
        (if (null? set2) '()
          (main set1 set2))))))

; mergesort - Expects a flat (no sub-lists) list of integers. Sorts the
; integers using the merge sort algorithm and returns the resulting sorted
; list.
; Returns: (list) The resulting sorted list.
; Parameters:
; lst (list) - flat list of integers
(define mergesort
  (lambda (lst)
    (letrec ((main (lambda (l)
                     (if (null? (cdr l)) l
                       (main-aux (list-rev (low l (mid l) 0 '()) '())
                                 (list-rev (high l (mid l) 0 '()) '())))))
             (main-aux (lambda (left right)
                         (merge (main left) (main right) '())))
             (list-rev (lambda (l o)
                   (if (null? l) o
                     (list-rev (cdr l) (cons (car l) o)))))
             (merge (lambda (left right o)
                      (if (null? left)
                        (if (null? right)
                          (list-rev o '())
                          (merge left (cdr right) (cons (car right) o)))
                        (if (null? right)
                          (merge (cdr left) right (cons (car left) o))
                          (if (<= (car left) (car right))
                            (merge (cdr left) right (cons (car left) o))
                            (merge left (cdr right) (cons (car right) o)))))))
             (mid (lambda (l)
                    (ceiling (/ (length l) 2))))
             (low (lambda (l m i o)
                    (if (= i m) o
                      (low (cdr l) m (+ i 1) (cons (car l) o)))))
             (high (lambda (l m i o)
                     (if (>= i m)
                       (if (null? (cdr l)) (cons (car l) o)
                         (high (cdr l) m (+ i 1) (cons (car l) o)))
                       (high (cdr l) m (+ i 1) o)))))
      (if (null? lst) '()
        (main lst)))))

; powerset - Expects a flat (no sub-lists) list representing a set of of
; integers. Returns a list of lists representing the powerset of the input set
; Returns: (list) List of lists representing the powerset of the input set.
; Parameters:
; lst (list) - flat list of integers
(define powerset
  (lambda (lst)
    (letrec ((main (lambda (l o)
                     (if (null? l) (cons '() o)
                       (main 
                         (cdr l)
                         (main-aux o (car l) o)))))
             (main-aux (lambda (l a o)
                         (if (null? l) (cons (cons a '()) o)
                           (main-aux
                             (cdr l)
                             a
                             (cons (cons a (car l)) o))))))
      (main lst '()))))

; nested-reduce - Expects a list of integers, which may include sublists
; (nested lists). Returns a version of the list that has no duplicate integers,
; and no duplicate sublists. Order matters. lst made up of integers and lists
; of integers, So assuming if not list then integer.
; Returns: (list) List with no duplicate integers and no duplicate sublists.
; Parameters:
; lst (list) - ordered list of integers and lists of integers
(define nested-reduce
  (lambda (lst)
    (letrec ((main (lambda (l o)
                     (if (null? l) (list-rev o '())
                       (main
                         (list-rev (prune l (car l) '()) '())
                         (if (list? (car l))
                           (cons (main (car l) '()) o)
                           (cons (car l) o))))))
             (prune (lambda (l a o)
                      (if (null? l) o
                        (if (list? a)
                          (if (list? (car l))
                            (if (equal?
                                  (main (car l) '())
                                  (main a '()))
                              (prune (cdr l) a o)
                              (prune (cdr l) a (cons (main (car l) '()) o)))
                            (prune (cdr l) a (cons (car l) o)))
                          (if (list? (car l))
                            (prune (cdr l) a (cons (car l) o))
                            (if (= a (car l))
                              (prune (cdr l) a o)
                              (prune (cdr l) a (cons (car l) o))))))))
             (list-rev (lambda (l o)
                   (if (null? l) o
                     (list-rev (cdr l) (cons (car l) o))))))
      (main lst '()))))
