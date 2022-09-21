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
                           (loop1 (cdr set1sub set2big))
                           #f))))))))
              (let ((a (loop1 set1 set2))
                    (b (loop1 set2 set1)))
                (if (eqv? a b) a #f)))))

