#lang racket
; Eric Foy

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

(define union
  (lambda (set1 set2)
    (if (equal? set1 '())
      set2
      (if (equal? set2 '())
        set1
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
          (loop set1 set2))))))

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
