;; sicp 1.14

(define num-calls 0)

(define (count-change amount)
  (set! num-calls 0)
  (cc amount 5))

(define (cc amount kind-of-coins)
  (set! num-calls (+ 1 num-calls))
  (display "-> ")
  (display num-calls)
  (display " -- ")
  (display amount)
  (display " -- ")
  (display kind-of-coins)
  (newline)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kind-of-coins 0)) 0)
        (else (+ (cc amount (- kind-of-coins 1))
                 (cc (- amount (fst-denom kind-of-coins)) kind-of-coins)))))

(define (fst-denom kind-of-coins)
  (cond ((= kind-of-coins 1) 1)
        ((= kind-of-coins 2) 5)
        ((= kind-of-coins 3) 10)
        ((= kind-of-coins 4) 25)
        ((= kind-of-coins 5) 50)))

;; (newline)
;; (count-change 100)
;; (newline)

(count-change 11)
(newline)
