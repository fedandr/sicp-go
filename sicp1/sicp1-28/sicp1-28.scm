;; sicp 1.28 Running prime-test, Fermat test, Miller-Rabin test

(define (divisor n)
  (let ((z (sqrt n)))
    (if (even? n) 2
	(do ((j 3 (+ j 2)))
	    ((or (= 0 (remainder n j)) (> j z)) (if (> j z) n j))))))

(define (prime? n)
  (= n (divisor n)))

(define (expmod bs ex md)
  (cond ((= ex 0) 1)
	((even? ex) (remainder (expt (expmod bs (/ ex 2) md) 2) md))
	(else (remainder (* bs (expmod bs (- ex 1) md)) md))))

(define (expmod-mr bs ex md)
  (cond ((= ex 0) 1)
	((even? ex)
	 (let ((ii (expmod-mr bs (/ ex 2) md)))
	   (if (and
		(not (or (= ii 1) (= ii (- md 1))))
		(= 1 (remainder (expt ii 2) md)))
	       0
	       (remainder (expt ii 2) md))))
	(else (remainder (* bs (expmod-mr bs (- ex 1) md)) md))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else #f)))

(define (fermat-test-mr n)
  (define (try-it a)
    (= (expmod-mr a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (mr-prime? n times)
  (cond ((= times 0) #t)
	((fermat-test-mr n) (mr-prime? n (- times 1)))
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
  (if (fast-prime? n (isqrt n))
      (report-prime (time-difference (current-time) start-time))
      (display " --- not prime")))

(define (start-mr-test n start-time)
  (define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))
  (if (mr-prime? n (isqrt n))
      (report-prime (time-difference (current-time) start-time))
      (display " --- not prime")))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-time))
  (start-fermat-test n (current-time))
  (start-mr-test n (current-time)))

(define (search-for-primes n m)
  (do ((k (if (odd? n) n (+ n 1)) (+ k 2)))
    ((> k m) (newline) (display "end search") (newline))
    (timed-prime-test k)))

(search-for-primes 6600 6650)
