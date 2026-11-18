;; sicp 1.29

(define (inc n) (+ n 1))

(define (sum term a next b)
  (if (> a b) 0
    (+ (term a) (sum term (next a) next b))))

(define (integral-t f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))

(define (integral-s f a b n)
  (if (odd? n) (set! n (+ n 1)))
  (let ((h (/ (- b a) n))
        (i (+ (f a) (f b))))
    (do ((k 1 (+ k 1)))
      ((= k n) (/ (* i h) 3))
      (let ((x (+ a (* k h))))
        (if (odd? k)
          (set! i (+ i (* 4 (f x))))
          (set! i (+ i (* 2 (f x)))))))))

(define (cube x)
  (* x x x))

(newline)
(display (integral-t cube 0 1 0.001))
(newline)
(display (integral-s cube 0 1 100))
