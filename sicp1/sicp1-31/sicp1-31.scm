;; sicp 1.31

(define (prod-r term a next b)
  (if (> a b) 1
    (* (term a) (prod-r term (next a) next b))))

(define (prod-i term a next b)
  (define (iter a result)
    (if (> a b) result
      (iter (next a) (* result (term a)))))
  (iter a 1))

(define (inc2 n)
  (+ n 2))

(define (squared n)
  (* n n))

(define (terms n)
  (/ (* n (+ n 2)) (squared (+ n 1))))

(define (prod-terms-r a b)
  (prod-r terms a inc2 b))
  
(define (prod-terms-i a b)
  (prod-i terms a inc2 b))

(newline)
(display "recursive: ")
(display (- pi (* 4 (prod-terms-r 2 100))))
(newline)
(display "iterative: ")
(display (- pi (* 4 (prod-terms-i 2 100))))
