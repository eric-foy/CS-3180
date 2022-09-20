(let loop ((j 0))
  (when (< j 5)
    (begin
      (display j)
      (loop (+ j 1)))))
