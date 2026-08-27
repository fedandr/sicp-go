;; sicp-1-12

; binomial coefficients for Pascal's triangle
(define (cfk n k)
  (cond
    ((or (< k 0) (> k n)) 0)
    ((or (= k 0) (= k n)) 1)
    (else (+ (cfk (- n 1) (- k 1)) (cfk (- n 1) k)))))

; 6
(display (cfk 4 2))
