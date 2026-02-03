;; sicp 1.05
;; Applicative order => infinite loop until stack overflow

(define (p) (p))

(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))
