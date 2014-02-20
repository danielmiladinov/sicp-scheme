; Define a procedure that takes three numbers as arguments
; and returns the sum of the squares of the two larger numbers
(define (sum a b) (+ a b))

(define (square x) (* x x))

(define (min-2 x y) (if (< x y) x y))
(define (min-3 x y z) (min-2 (min-2 x y) z))

(define (sum-of-largest-2-squares a b c)
  (cond ((= (min-3 a b c) a) (sum (square b) (square c)))
        ((= (min-3 a b c) b) (sum (square a) (square c)))
        (else (sum (square b) (square a)))))

(define (assert-equal x y) (if (= x y) "ok" "not ok"))

(assert-equal (sum-of-largest-2-squares 2 3 4) 25)
(assert-equal (sum-of-largest-2-squares 2 4 3) 25)
(assert-equal (sum-of-largest-2-squares 3 2 4) 25)
(assert-equal (sum-of-largest-2-squares 3 4 2) 25)
(assert-equal (sum-of-largest-2-squares 4 2 3) 25)
(assert-equal (sum-of-largest-2-squares 4 3 2) 25)
(assert-equal (sum-of-largest-2-squares 2 2 3) 13)
(assert-equal (sum-of-largest-2-squares 2 3 2) 13)
(assert-equal (sum-of-largest-2-squares 3 2 2) 13)
(assert-equal (sum-of-largest-2-squares 2 2 2) 8)