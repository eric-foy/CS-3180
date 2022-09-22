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

(define bubble-sort
  (lambda (l)
    (letrec ((loop1 (lambda (l o1)
                      (begin (display l) (display o1)
                      (if (null? l) o1
                        (loop2 l o1 '())))))
             (loop2 (lambda (l o1 o2)
                     (if (null? (cdr l)) (loop1
                                           (list-rev o2 '())
                                           (cons (car l) o1))
                       (if (> (car l) (car (cdr l)))
                         (loop2 (cons (car l)
                                     (cdr (cdr l)))
                               o1
                               (cons (car (cdr l)) o2))
                         (loop2 (cdr l) o1 (cons (car l) o2))))))
             (list-rev (lambda (l o)
                   (if (null? l) o
                     (list-rev (cdr l) (cons (car l) o))))))
      (loop1 l '()))))


(define sort-once
  (lambda (l)
    (letrec ((loop (lambda (l o)
                     (if (null? (cdr l)) (cons (car l) o)
                       (if (> (car l) (car (cdr l)))
                         (loop (cons (car l)
                                     (cdr (cdr l)))
                               (cons (car (cdr l)) o))
                         (loop (cdr l) (cons (car l) o)))))))
      (loop l '()))))

(define list-swap
  (lambda (l a b ata atb)
    (letrec ((loop (lambda (l o i)
                     (if (null? l) o
                       (if (= a i) (loop (cdr l) (cons atb o) (+ i 1))
                         (if (= b i) (loop (cdr l) (cons ata o) (+ i 1))
                           (loop (cdr l) (cons (car l) o) (+ i 1))))))))
      (loop l '() 0))))

(define list-at
  (lambda (l a)
    (letrec ((loop (lambda (l i)
                     (if (= i a) (car l)
                       (loop (cdr l) (+ i 1))))))
      (loop l 0))))

(define list-rev
  (lambda (l)
    (letrec ((loop (lambda (l o)
                   (if (null? l) o
                     (loop (cdr l) (cons (car l) o))))))
      (loop l '()))))

(define list-len
  (lambda (l)
    (letrec ((loop (lambda (l n)
                     (if (null? l) n
                       (loop (cdr l) (+ n 1))))))
      (loop l 0))))
