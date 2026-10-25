;; sicp 1.15

(define (sine angle)
  (define (cube x)
    (* x x x))
  (define (poli x)
    (display "--> p: ")
    (display x)
    (newline)
    (- (* 3 x) (* 4 (cube x))))
  (display "-> ")
  (display angle)
  (newline)
  (if (not (> (abs angle) 0.1))
      angle
      (poli (sine (/ angle 3.0)))))

(sine 12.15)

;; poli is called 5 times
;; logaritmic base 3 growth (log (/ angle 0.1) 3) == (log (* 10 angle) 3)
;; number of steps == (log angle 3)
;; the process is recursive, not iterative, so space is also (log angle 3)
