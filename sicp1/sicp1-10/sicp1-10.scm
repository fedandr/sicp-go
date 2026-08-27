;; sicp1-10

; Ackermann function
(define (Ack x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (Ack (- x 1) (Ack x (- y 1))))))

(define (f n) (Ack 0 n))
; 2n

(define (g n) (Ack 1 n))
; 0 for n=0, 2^n for n>0

(define (h n) (Ack 2 n))
; 0 for n=0, 2 for n=1, 2^(2^(2^(2...))) n times = 2^(h (- n 1)) for n>1

(define (k n) (* 5 n n))
; 5*n^2

(display (Ack 1 10))
(newline)
(display (Ack 2 4))
(newline)
(display (Ack 3 3))
(newline)
