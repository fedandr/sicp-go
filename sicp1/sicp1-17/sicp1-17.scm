;; sicp 1.17

(define (mul a b)
  (define (double k)
    (+ k k))
  (define (halve k)
    (/ k 2))
  (cond ((= 0 b) 0)
        ((even? b) (mul (double a) (halve b)))
        (else (+ a (mul a (- b 1))))))
