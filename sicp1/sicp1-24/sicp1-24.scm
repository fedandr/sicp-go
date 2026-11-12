;; sicp 1.24, Chez Scheme version without (runtime),
;; replaced with (current-time) instead.

(define (divisor n)
  (let ((z (sqrt n)))
    (if (even? n) 2
	(do ((j 3 (+ j 2)))
	    ((or (= 0 (remainder n j)) (> j z)) (if (> j z) n j))))))

(define (prime? n)
  (= n (divisor n)))

(define (expmod bs ex md)
  (cond
    ((= ex 0) 1)
    ((even? ex) (remainder (expt (expmod bs (/ ex 2) md) 2) md))
    (else (remainder (* bs (expmod bs (- ex 1) md)) md))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond
    ((= times 0) #t)
    ((fermat-test n) (fast-prime? n (- times 1)))
    (else #f)))

(define (start-prime-test n start-time)
  (define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))
  (if (prime? n)
      (report-prime (time-difference (current-time) start-time))
      (display " --- not prime")))

(define (start-fermat-test n start-time)
  (define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))
  (if (fast-prime? n 100)
      (report-prime (time-difference (current-time) start-time))
      (display " --- not prime")))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-time))
  (start-fermat-test n (current-time)))

(define (search-for-primes n m)
  (do ((k (if (odd? n) n (+ n 1)) (+ k 2)))
    ((> k m) (newline) (display "end search") (newline))
    (timed-prime-test k)))

(define j 50)
(search-for-primes 1000 (+ 1000 j))
(search-for-primes 10000 (+ 10000 j))
(search-for-primes 100000 (+ 100000 j))
(search-for-primes 1000000000 (+ 1000000000 j))


;; For relatively small n, regular prime test is actually faster than Fermat.
;; Fermat becomes faster for n > 10^8 or 10^9.
