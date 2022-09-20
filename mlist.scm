(define my-eval (lambda (exp)
		  (eval (read (open-input-string exp)))))

(define tostring
    (lambda (a)
      (define o (open-output-string))
      (write a o)
      (string-append "'" (get-output-string o))))

(define mlist
    (lambda (a . b)
	(define f
	      (lambda (a b)
		(let loop ((o (string-append "(mcons " (tostring a))) (b b))
		  (if (null? b) o
		      (loop (string-append o " (mcons " (tostring (car b))) (cdr b))))))
	(define g
	    (lambda (b)
	      (let loop ((o "'())") (b b))
		(if (null? b) o
		    (loop (string-append o ")") (cdr b))))))
        (my-eval (string-append (f a b) (g b)))))
