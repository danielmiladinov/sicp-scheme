; Alyssa’s idea is to implement “interval arithmetic” as a set of arithmetic operations
; for combining “intervals” (objects that represent the range of possible values of an
; inexact quantity). The result of adding, subtracting, multiply- ing, or dividing two
; intervals is itself an interval, represent- ing the range of the result.

; Alyssa postulates the existence of an abstract object called an “interval” that has
; two endpoints: a lower bound and an upper bound. She also presumes that, given the
; endpoints of an interval, she can construct the interval using the data constructor
; make-interval. Alyssa first writes a procedure for adding two intervals. She reasons
; that the minimum value the sum could be is the sum of the two lower bounds and the
; maximum value it could be is the sum of the two upper bounds:

(define (add-interval x y)
     (make-interval (+ (lower-bound x)
                       (lower-bound y))
                    (+ (upper-bound x)
                       (upper-bound y))))

; Alyssa also works out the product of two intervals by finding the minimum and
; the maximum of the products of the bounds and using them as the bounds of the
; resulting interval. (Min and max are primitives that find the minimum or maximum
; of any number of arguments.)

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x)
               (lower-bound y)))
        (p2 (* (lower-bound x)
               (upper-bound y)))
        (p3 (* (upper-bound x)
               (lower-bound y)))
        (p4 (* (upper-bound x)
               (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

; To divide two intervals, Alyssa multiplies the first by the reciprocal of the second.
; Note that the bounds of the reciprocal interval are the reciprocal of the upper bound
; and the reciprocal of the lower bound, in that order.

(define (div-interval x y)
  (mul-interval x
                (make-interval
                 (/ 1.0 (upper-bound y))
                 (/ 1.0 (lower-bound y)))))

; Alyssa’s program is incomplete because she has not specified the implementation of the
; interval abstraction. Here is a definition of the interval constructor:

(define (make-interval a b) (cons a b))

; Define selectors upper-bound and lower-bound to complete the implementation.

(define (upper-bound interval) (cdr interval))
(define (lower-bound interval) (car interval))