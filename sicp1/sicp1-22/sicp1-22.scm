;; sicp 1.22, Chez Scheme version without (runtime),
;; replaced with (current-time) instead.
;; Another possibility would be (real-time).

(define (square n)
  (* n n))

(define (divides? a b)
  (= 0 (remainder b a)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (if (> n 1) (= n (smallest-divisor n)) #f))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-time)))

(define (start-prime-test n start-time)
  (define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))
  (if (prime? n)
      (report-prime (time-difference (current-time) start-time))
      (display " --- not prime")))

(define (search-for-primes n m)
  (do ((k (if (odd? n) n (+ n 1)) (+ k 2)))
      ((> k m) (newline) (display "end search") (newline))
    (timed-prime-test k)))

(define j 50)
(search-for-primes 1000 (+ 1000 j))
(search-for-primes 10000 (+ 10000 j))
(search-for-primes 100000 (+ 100000 j))
(search-for-primes 1000000 (+ 1000000 j))

;; expectation about slowdown being proportional to (sqrt 10) is confirmed 
