;; sicp 1.16

(define (pwr b n)
  (define (pow b n a)
    (cond ((= 0 n) a)
          ((even? n) (pow (* b b) (/ n 2) a))
          (else (pow b (- n 1) (* a b)))))
  (pow b n 1))
