;; sicp 1.21

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
  (= n (smallest-divisor n)))

(define (showdiv n)
  (newline)
  (display "--> ")
  (display n)
  (display " --> ")
  (display (smallest-divisor n))
  (newline))

(showdiv 199)
(showdiv 1999)
(showdiv 19999)
