(define my-eval (lambda (exp)
		  (eval (read (open-input-string exp)))))


(define i (open-input-file "current.txt"))
(define my-eval-loop (lambda ()
                         (define line (read-line i))
                         (unless (eof-object? line)
                           (display (my-eval line))
                           (newline)
                           (my-eval-loop))))
(close-input-port i)
