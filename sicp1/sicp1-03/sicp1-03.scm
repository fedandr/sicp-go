;; sicp 1.03

(define (sum-max-sq a b c)
  (define (s2s x y)
    (+ (* x x) (* y y)))
  (cond
    [(and (<= a b) (<= a c)) (s2s b c)]
    [(and (<= b a) (<= b c)) (s2s a c)]
    [(and (<= c a) (<= c b)) (s2s a b)]))
