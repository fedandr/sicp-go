;; sicp 1.08

(define precision 0.000001)

(define (converge? guess0 guess1)
  (< (abs (- guess0 guess1)) (* guess0 precision)))

(define (n3rt x)
  (define (improve y)
    (/ (+ (/ x (* y y)) (* 2 y)) 3.0))
  (define (n3rt-iter guess)
    (if (converge? guess (improve guess))
        guess
        (n3rt-iter (improve guess))))
  (n3rt-iter 1.0))
