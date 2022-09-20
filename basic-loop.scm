(define countdown (lambda (i)
		    (if (= i 0) 'liftoff
		      (begin
			(display i)
			(newline)
			(countdown (- i 1))))))

(countdown 10)
