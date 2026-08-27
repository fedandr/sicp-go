;; sicp-1-11

; recursive process
(define (f1 n)
  (if (< n 3) n (+ (f1 (- n 1)) (* 2 (f1 (- n 2))) (* 3 (f1 (- n 3))))))

; iterative process
(define (f2 n)
  (define (fi a b c n)
    (cond ((= 0 n) c)
          ((= 1 n) b)
          ((= 2 n) a)
          (else (fi (+ a (* 2 b) (* 3 c)) a b (- n 1)))))
  (fi 2 1 0 n))
