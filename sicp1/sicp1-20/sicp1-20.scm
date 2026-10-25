;; sicp 1.20

(define (gcd a b)
  (if (= b 0) a (gcd b (remainder a b))))

(gcd 206 40)


;; applicative order == 4 remainder operations
;; normal order == 18 reminder operations
