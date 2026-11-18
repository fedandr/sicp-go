;; sicp 1.30

(define (sum-r term a next b)
  (if (> a b) 0
    (+ (term a) (sum-r term (next a) next b))))

(define (sum-i term a next b)
  (define (iter a result)
    (if (> a b) result
      (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (inc n)
  (+ n 1))

(define (cube n)
  (* n n n))

(define (sum-cubes-r a b)
  (sum-r cube a inc b))
  
(define (sum-cubes-i a b)
  (sum-i cube a inc b))

(newline)
(display "recursive: ")
(display (sum-cubes-r 1 100))
(newline)
(display "iterative: ")
(display (sum-cubes-i 1 100))
