;; sicp 1.06
;; Infinite loop results in stack overflow, running out of memory.
;; Infinite loop, since new-if is not a special form but a procedure,
;; so all its arguments must be evaluated before procedure application.

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y ) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (f-sqrt x)
  (sqrt-iter 1.0 x))

(define (new-if predicate then-clause else-clause)
  (cond
    (predicate then-clause)
    (else else-clause)))

(define (new-sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (new-sqrt-iter (improve guess x) x)))

(define (new-f-sqrt x)
  (new-sqrt-iter 1.0 x))

(display (f-sqrt 2))(newline) ;; OK
(display (new-f-sqrt 2))(newline) ;; Infinite loop
