;; sicp 1.33

(define (filt-accum-r combiner unit filter term a next b)
  (if (> a b) unit
      (let ((trm (term a)))
	(combiner (if (filter trm) trm unit)
		  (filt-accum-r combiner unit filter term (next a) next b)))))

(define (filt-accum-i combiner unit filter term a next b)
  (define (iter a result)
    (if (> a b) result
	(let ((trm (term a)))
	  (iter (next a)
		(combiner (if (filter trm) trm unit) result)))))
  (iter a unit))

(define (divisor n)
  (let ((z (sqrt n)))
    (if (even? n) 2
	(do ((j 3 (+ j 2)))
	    ((or (= 0 (remainder n j)) (> j z)) (if (> j z) n j))))))

(define (prime? n)
  (and (> n 1) (= n (divisor n))))

(define (gcd a b)
  (if (= b 0) a (gcd b (remainder a b))))

(define (sum-prime-squares a b)
  (filt-accum-r +
		0
		(lambda (x)
		  (let ((y (isqrt x))) (and (prime? y) (= x (* y y)))))
		(lambda (x) (* x x))
		a
		(lambda (x) (+ 1 x))
		b))

(define (product-coprimes n)
  (filt-accum-i *
		1
		(lambda (x) (= (gcd x n) 1))
		(lambda (x) x)
		1
		(lambda (x) (+ 1 x))
		n))

(newline)
(display (sum-prime-squares 1 10))
(newline)
(display (product-coprimes 10))
(newline)

