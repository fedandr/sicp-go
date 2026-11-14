;; sicp 1.27
;; Check Carmichael numbers

(define carmichlist (list 561 1105 1729 2465 2821 6601))

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

(define (fermat-pass? n)
  (define (fermat-tests a)
    (cond
      ((= a 1) #t)
      ((= (expmod a n n) a) (fermat-tests (- a 1)))
      (else #f)))
  (fermat-tests (- n 1)))

(define (carmichael? n)
  (and (fermat-pass? n) (not (prime? n))))

(define (check-carmichlist)
  (do ((ll carmichlist (cdr ll)))
      ((null? ll) (display "checked") (newline))
    (display (car ll))
    (display " --> ")
    (display (carmichael? (car ll)))
    (newline)))

(check-carmichlist)
