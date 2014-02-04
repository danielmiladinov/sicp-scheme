; Observe that our model of evalution allows for combinations
; whose operators are compound expressions. Use this observation
; to describe the behavior of the following procedure:

(define (a-plus-abs-b a b)
     ((if (> b 0) + -) a b))

; The "absoluteness" of b determines whether or not addition or subtraction
; is used to combine a and b. In either case, it will cause the value of a
; to be added to the absolute value of b.