; Ben Bitdiddle has invented a test to determine 
; whether the interpreter he is faced with is
; using applicative-order evalution or normal-
; order evaluation. He defines the following
; two procedures:

(define (p) (p))
(define (test x y) (if (= x 0) 0 y))

; Then he evaluates the expression

(test 0 (p))

; What behavior will Ben observe with an interpreter 
; that uses applicative-order evaluation? What behavior 
; will he observe with an interpreter that uses normal-
; order evaluation? Explain your answer. (Assume that 
; the evaluation rule for the special form if is the same 
; whether the interpreter is using normal or applicative 
; order: The predicate expression is evaluated first, 
; and the result determines whether to evaluate the consequent 
; or the alternative expression.)

; In an interpreter using normal-order evaluation, the
; interpreter would first expand the code of (test) to its
; underlying (if) expression, such that the expression on
; the left results in the expression on the right:
; (test 0 (p)) => (if (= 0 0) 0 (p))
; Next, the special-form if would be applied. Since the predicate
; (= 0 0) evaluates to true, the first term, 0, would be returned.

; In an interpreter using applicative-order evaluation, the
; evaluation of the expression (test 0 (p)) would never terminate,
; since (p) is infinitely recursive.