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
      (loop set1 set2))))
