; Newton’s method for cube roots is based on the fact that if y
; is an approximation to the cube root of x, then a better
; approximation is given by the value
; (x /y^2 + 2y) / 3 .

; Use this formula to implement a cube-root procedure
; analogous to the square-root procedure.

; As with sqrt, we'll use a recursive solution
; with an initial guess of 1.0
(define (cube-root x)
  (cube-root-iter 1.0 x))

; Use the improved good-enough? function from Exercise 1.7
(define (good-enough? old-guess new-guess)
  (< (/ (abs (- old-guess new-guess)) old-guess) 0.000001))

(define (cube-root-iter guess x)
    (if (good-enough? guess (improve guess x))
        guess
        (cube-root-iter (improve guess x) x)))

; This is the approximation formula from the exercise text:
(define (improve y x)
  (/
   (+ (/ x (* y y)) (* 2 y))
   3))