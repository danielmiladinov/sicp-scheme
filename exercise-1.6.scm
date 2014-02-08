; Alyssa P. Hacker doesn’t see why if needs to be provided as a special form.
; "Why can’t I just define it as an ordinary procedure in terms of cond?" she asks. 
; Alyssa's friend Eva Lu Ator claims this can indeed be done, and she defines 
; a new version of if:

(define (new-if predicate
                then-clause
                else-clause)
  (cond (predicate the-clause)
        (else else-clause)))

; Eva demonstrates the program for Alyssa:

(new-if (= 2 3) 0 5)
; 5

(new-if (= 1 1) 0 5)
; 0

; Delighted, Alyssa uses new-if to rewrite the square-root program:

(define (sqrt-iter guess x)
     (new-if (good-enough? guess x)
             guess
             (sqrt-iter (improve guess x) x)))

; What happens when Alyssa attempts to use this 
; to compute square roots? Explain.

; Because new-if isn't itself a special form, both the guess as well
; as the next sqrt-iter will be evaluated. Sqrt-iter is infinitely 
; recursive, and, without the escape clause of good-enough? ever 
; returning true and preventing the next iteration, will never terminate.