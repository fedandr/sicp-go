;; sicp1-09

(define (inc n)
  (+ n 1))

(define (dec n)
  (- n 1))

;; linear recursive process, no tail recursion
(define (plus-r a b)
  (display (list "-->" a b))
  (newline)
  (if (= a 0) b (inc (plus-r (dec a) b))))

;; linear iterative process, with tail recursion
(define (plus-i a b)
  (display (list "-->" a b))
  (newline)
  (if (= a 0) b (plus-i (dec a) (inc b))))

(newline)
(display (plus-i 3 2))
(newline)(newline)
(display (plus-r 3 2))
(newline)
