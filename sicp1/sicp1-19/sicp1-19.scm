;; sicp 1.19

(define (fib n)
  (define (fib-iter a b p q k)
    (cond ((= k 0) b)
          ((even? k)
           (fib-iter a
		                 b
		                 (+ (* p p) (* q q))
		                 (+ (* 2 p q) (* q q))
		                 (/ k 2)))
          (else
           (fib-iter (+ (* b q) (* a q) (* a p))
		                 (+ (* b p) (* a q))
		                 p
		                 q
		                 (- k 1)))))
  (fib-iter 1 0 0 1 n))
