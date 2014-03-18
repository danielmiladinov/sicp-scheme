; Each of the following two procedures defines a method for adding two positive integers in terms of the procedures inc,
; which increments its argument by 1, and dec, which decrements its argument by 1.

(define (+ a b)
  (if (= a 0) b (inc (+ (dec a) b))))

(define (+ a b)
  (if (= a 0) b (+ (dec a) (inc b))))

; Using the substitution model, illustrate the process generated by each procedure in evaluating (+ 4 5).
; Are these processes iterative or recursive?

; Here is the substitution model for the first procedure:
(+ 4 5)
(if (= 4 0) 5 (inc (+ (dec 4) 5)))
(if (= 4 0) 5 (inc (+ 3 5)))
(if (= 4 0) 5 (inc (if (= 3 0) 5 (inc (+ (dec 3) 5)))))
(if (= 4 0) 5 (inc (if (= 3 0) 5 (inc (+ 2 5)))))
(if (= 4 0) 5 (inc (if (= 3 0) 5 (inc (if (= 2 5) 5 (inc (+ (dec 2) 5)))))))
(if (= 4 0) 5 (inc (if (= 3 0) 5 (inc (if (= 2 5) 5 (inc (+ 1 5)))))))
(if (= 4 0) 5 (inc (if (= 3 0) 5 (inc (if (= 2 5) 5 (inc (if (= 1 5) 5 (inc (+ (dec 1) 5)))))))))
(if (= 4 0) 5 (inc (if (= 3 0) 5 (inc (if (= 2 5) 5 (inc (if (= 1 5) 5 (inc (+ 0 5)))))))))
(if (= 4 0) 5 (inc (if (= 3 0) 5 (inc (if (= 2 5) 5 (inc (if (= 1 5) 5 (inc (if (= 0 0) 5 (inc (+ (dec 0) 5)))))))))))
(if (= 4 0) 5 (inc (if (= 3 0) 5 (inc (if (= 2 5) 5 (inc (if (= 1 5) 5 (inc 5))))))))
(if (= 4 0) 5 (inc (if (= 3 0) 5 (inc (if (= 2 5) 5 (inc (if (= 1 5) 5 6)))))))
(if (= 4 0) 5 (inc (if (= 3 0) 5 (inc (if (= 2 5) 5 (inc 6))))))
(if (= 4 0) 5 (inc (if (= 3 0) 5 (inc (if (= 2 5) 5 7)))))
(if (= 4 0) 5 (inc (if (= 3 0) 5 (inc 7))))
(if (= 4 0) 5 (inc (if (= 3 0) 5 8)))
(if (= 4 0) 5 (inc 8))
(if (= 4 0) 5 9)
9

; This function is recursive because it calls itself in order to calculate its results.
; However, since the recursive call is not the last thing it performs, the function
; is not tail recursive. However, using the book's definition, this procedure is
; recursive, not iterative.

(define (+ a b)
  (if (= a 0) b (+ (dec a) (inc b))))

; Here is the substitution model for the second procedure:
(+ 4 5)
(if (= 4 0) 5 (+ (dec 4) (inc 5)))
(if (= 4 0) 5 (+ 3 6))
(+ 3 6)
(if (= 3 0) 6 (+ (dec 3) (inc 6)))
(if (= 3 0) 6 (+ 2 7))
(+ 2 7)
(if (= 2 0) 7 (+ (dec 2) (inc 7)))
(if (= 2 0) 7 (+ 1 8))
(+ 1 8)
(if (= 1 0) 8 (+ (dec 1) (inc 8)))
(if (= 2 0) 7 (+ 0 9))
(+ 0 9)
(if (= 0 0) 9 (+ (dec 0) (inc 9)))
9

; This function is also recursive as it also calls itself in order to calculate its results.
; However, since the recursive call is the final operation performed, the function is tail
; recursive. There is no need to preserve intermediate results from the previous invocation
; since they are used directly as arguments to the next recursive call. It can be tail call
; optimized to operate in constant space. Using the book's definition, this procedure is
; iterative, not recursive.