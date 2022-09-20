(define i (open-input-file "hello.txt"))
(let loop ((c (read-char i)))
   (unless (eof-object? c)
    (begin
      (display c)
      (loop (read-char i)))))
