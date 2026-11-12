;; sicp 1.23, Chez Scheme version without (runtime),
;; replaced with (current-time) instead.
;; Another possibility would be (real-time).

(define (divides? a b)
  (= (remainder b a) 0))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (define (next n)
    (if (= n 2) 3 (+ n 2)))
  (cond
    ((> (expt test-divisor 2) n) n)
    ((divides? test-divisor n) test-divisor)
    (else (find-divisor n (next test-divisor)))))

(define (divisor n)
  (let ((z (sqrt n)))
    (if (even? n) 2
	(do ((j 3 (+ j 2)))
	((or (= 0 (remainder n j)) (> j z)) (if (> j z) n j))))))

(define (prime? n)
  ; (= n (smallest-divisor n)))
  (= n (divisor n)))

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

;; Confirmed that the new (divisor) version is twice as fast.
;; Confirmed that the new (smallest-devisor) version is only 1.5 times faster.
