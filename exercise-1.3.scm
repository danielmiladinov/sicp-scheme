; Define a procedure that takes three numbers as arguments
; and returns the sum of the squares of the two larger numbers
(define (sum a b) (+ a b))

(define (square x) (* x x))

(define (sum-of-largest-two-squares a b c)
  (cond ((< a b c) (sum (square c) (square b)))
        ((< a c b) (sum (square b) (square c)))
        ((< b a c) (sum (square c) (square a)))
        ((< b c a) (sum (square a) (square c)))
        ((< c a b) (sum (square b) (square a)))
        ((< c b a) (sum (square a) (square b)))
        (else (sum (square a) (square b)))))
        