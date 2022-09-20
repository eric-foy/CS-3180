(define-syntax define-macro
    (syntax-rules ()
      ((_ name rest ...)
       (define-syntax name
         (syntax-rules ()
           (syntax-rules ()
             ((_ rest ...)
              (rest ...))))))))

(define define-macro
    (lambda (name rest ...)
      (define-syntax name
        (syntax-rules ()
          ((_ rest ...)
           (rest ...))))))

(define-syntax while
  (syntax-rules ()
    ((_ pred b1 ...)
     (let loop () (when pred b1 ... (loop))))))

(define-syntax when
  (syntax-rules ()
    ((_ pred b1 ...)
     (if pred (begin b1 ...)))))


(define-macro when
  (lambda (test . branch)
    (list 'if test
      (cons 'begin branch))))
