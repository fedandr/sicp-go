;; sicp 1.32

(define (accumulate-r combiner unit term a next b)
  (if (> a b) unit
      (combiner (term a) (accumulate-r combiner unit term (next a) next b))))

(define (accumulate-i combiner unit term a next b)
  (define (iter a result)
    (if (> a b) result
	(iter (next a) (combiner (term a) result))))
  (iter a unit))

(define (product-r term a next b)
  (accumulate-r * 1 term a next b))

(define (sum-i term a next b)
  (accumulate-i + 0 term a next b))

(define (inc n) (+ n 1))
(define (idt n) n)

(newline)
(display (sum-i idt 1 inc 100))
(newline)
(display (product-r idt 1 inc 10))
