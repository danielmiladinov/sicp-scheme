; Define a procedure that takes three numbers as arguments
; and returns the sum of the squares of the two larger numbers
(define (sum a b) (+ a b))

(define (square x) (* x x))

(define (sum-of-largest-2-squares a b c)
 (cond ((or (< a b c) (< a c b)) (sum (square b) (square c))) ; also covers (sum (square c) (square b))
       ((or (< b a c) (< b c a)) (sum (square a) (square c))) ; also covers (sum (square c) (square a))
       ((or (< c a b) (< c b a)) (sum (square a) (square b))) ; also covers (sum (square b) (square a))
       ((and (< a c) (= a b)) (sum (square b) (square c)))    ; e.g. 2 2 3
       ((and (< a b) (= a c)) (sum (square c) (square b)))    ; e.g. 2 3 2
       ((and (< b a) (= b c)) (sum (square a) (square b)))    ; e.g. 3 2 2
       (else (sum (square a) (square a)))))                   ; all 3 must be equal

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