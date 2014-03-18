; A function f is defined by the rule that
; f(n) is n if n is less than 3, otherwise
; f(n - 1) + 2f(n - 2) + 3f(n - 3) if n >= 3

; Write a procedure that computes f by means
; of a recursive process.
(define (f n)
  (if (< n 3) n
      (+ (* (f (- n 1)) 1)
         (* (f (- n 2)) 2)
         (* (f (- n 3)) 3))))

; Write a procedure that computes f by means
; of an iterative process.
(define (f n)
  (define (iterate a b c count)
    (if (= count 0) c
        (iterate (+ a (* 2 b) (* 3 c)) a b (dec count))))
  (iterate 2 1 0 n))