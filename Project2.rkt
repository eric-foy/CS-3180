(define set-equal?
    (lambda (set1 set2)
      (let loop1 ((set1sub set1))
        (if (null? set1sub) #t
            (let loop2 ((set2sub set2))
              (if (null? set2sub) #f
                  (if (= (car set1sub) (car set2sub)) (loop1 (cdr set1sub))
                      (loop2 (cdr set2sub)))))))))

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
              (begin
		(define a (loop1 set1 set2))
	        (define b (loop1 set2 set1))
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
	               (set-equal? (car set1sub) (car set2sub))))))))
              (begin
		(define a (loop1 set1 set2))
	        (define b (loop1 set2 set1))
	        (if (eqv? a b) a #f)))))

