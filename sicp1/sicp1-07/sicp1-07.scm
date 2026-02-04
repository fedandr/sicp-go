;; sicp 1.07

(define precision 0.000001)

(define (converge? guess0 guess1)
  (< (abs (- guess0 guess1)) (* guess0 precision)))

(define (n2rt x)
  (define (improve guess)
    (/ (+ guess (/ x guess)) 2.0))
  (define (sqrt-iter guess)
    (if (converge? guess (improve guess))
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))
