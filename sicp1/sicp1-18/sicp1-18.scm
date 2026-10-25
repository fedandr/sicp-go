;; sicp 1.18

(define (mult a b)
  (define (double k)
    (+ k k))
  (define (halve k)
    (/ k 2))
  (define (mlt a b c)
    (cond ((= 0 b) c)
          ((even? b) (mlt (double a) (halve b) c))
          (else (mlt a (- b 1) (+ c a)))))
  (mlt a b 0))
