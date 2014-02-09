; The good-enough? test used in computing square roots will not be very effective
; for finding the square roots of very small numbers. Also, in real computers,
; arithmetic operations are almost always performed with limited precision. This
; makes our test inadequate for very large numbers. Explain these statements, with
; examples showing how the test fails for small and large numbers. An alternative
; strategy for implementing good-enough? is to watch how guess changes from one
; iteration to the next and to stop when the change is a very small fraction
; of the guess. Design a square-root procedure that uses this kind of end test.
; Does this work better for small and large numbers?

; Here is the old square-root, modified to display the guesses tried and how many
; iterations were being performed:
(define (sqrt x)
  (sqrt-iter 1.0 x 0))

(define (sqrt-iter guess x iter)
  (display "\n(sqrt iteration ")
  (display iter)
  (display ") ")
  (cond
    ((good-enough? guess x)
     (display "Guess is good enough: ")
     guess)
    (else
     (display "Not good enough: ")
     (display guess)
     (sqrt-iter (improve guess x) x (+ 1 iter)))))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y) (/ (+ x y) 2))

(define (square x) (* x x))

; Here is the new implementation of good-enough? as well as a new
; version of sqrt-iter needed to call it differently, also instrumented
; to display guesses and iterations performed:
(define (new-good-enough? old-guess new-guess)
  (< (/ (abs (- old-guess new-guess)) old-guess) 0.001))

(define (new-sqrt-iter guess x iter)
    (display "\n(new-sqrt iteration ")
    (display iter)
    (display ") ")
    (cond
      ((new-good-enough? guess (improve guess x))
       (display "Guess is good enough: ")
       guess)
      (else
       (display "Not good enough: ")
       (display guess)
       (new-sqrt-iter (improve guess x) x (+ 1 iter)))))

(define (new-sqrt x)
  (new-sqrt-iter 1.0 x 0))

; While (sqrt 999999999999999999999) seemed to run indefinitely,
; (I stopped it at 5,856 iterations) (new-sqrt 999999999999999999999)
; performed much better.

; (sqrt 999999999999999999999)
; ......
; (sqrt iteration 5848) Not good enough: 31622776601.683792
; (sqrt iteration 5849) Not good enough: 31622776601.683792
; (sqrt iteration 5850) Not good enough: 31622776601.683792
; (sqrt iteration 5851) Not good enough: 31622776601.683792
; (sqrt iteration 5852) Not good enough: 31622776601.683792
; (sqrt iteration 5853) Not good enough: 31622776601.683792
; (sqrt iteration 5854) Not good enough: 31622776601.683792
; (sqrt iteration 5855) Not good enough: 31622776601.683792
; (sqrt iteration 5856) Not good enough: 31622776601.683792
; (sqrt iteration 5857. . user break

; (new-sqrt 999999999999999999999)
; (new-sqrt iteration 0) Not good enough: 1.0
; (new-sqrt iteration 1) Not good enough: 5e+20
; (new-sqrt iteration 2) Not good enough: 2.5e+20
; (new-sqrt iteration 3) Not good enough: 1.25e+20
; (new-sqrt iteration 4) Not good enough: 6.25e+19
; (new-sqrt iteration 5) Not good enough: 3.125e+19
; (new-sqrt iteration 6) Not good enough: 1.5625e+19
; (new-sqrt iteration 7) Not good enough: 7.8125e+18
; (new-sqrt iteration 8) Not good enough: 3.90625e+18
; (new-sqrt iteration 9) Not good enough: 1.953125e+18
; (new-sqrt iteration 10) Not good enough: 9.765625000000003e+17
; (new-sqrt iteration 11) Not good enough: 4.8828125000000064e+17
; (new-sqrt iteration 12) Not good enough: 2.4414062500000134e+17
; (new-sqrt iteration 13) Not good enough: 1.2207031250000272e+17
; (new-sqrt iteration 14) Not good enough: 6.103515625000546e+16
; (new-sqrt iteration 15) Not good enough: 3.051757812501092e+16
; (new-sqrt iteration 16) Not good enough: 15258789062521844.0
; (new-sqrt iteration 17) Not good enough: 7.62939453129369e+15
; (new-sqrt iteration 18) Not good enough: 3814697265712381.0
; (new-sqrt iteration 19) Not good enough: 1907348632987262.5
; (new-sqrt iteration 20) Not good enough: 953674316755775.2
; (new-sqrt iteration 21) Not good enough: 476837158902175.6
; (new-sqrt iteration 22) Not good enough: 238418580499663.8
; (new-sqrt iteration 23) Not good enough: 119209292346983.89
; (new-sqrt iteration 24) Not good enough: 59604650367795.84
; (new-sqrt iteration 25) Not good enough: 29802333572505.137
; (new-sqrt iteration 26) Not good enough: 14901183563462.271
; (new-sqrt iteration 27) Not good enough: 7450625336112.764
; (new-sqrt iteration 28) Not good enough: 3725379776517.4097
; (new-sqrt iteration 29) Not good enough: 1862824102762.9956
; (new-sqrt iteration 30) Not good enough: 931680461050.0533
; (new-sqrt iteration 31) Not good enough: 466376895208.79224
; (new-sqrt iteration 32) Not good enough: 234260541880.79922
; (new-sqrt iteration 33) Not good enough: 119264646605.99684
; (new-sqrt iteration 34) Not good enough: 63824680503.80246
; (new-sqrt iteration 35) Not good enough: 39746300344.66208
; (new-sqrt iteration 36) Not good enough: 32452937364.201084
; (new-sqrt iteration 37) Guess is good enough: 31633394544.89012

; Similarly, for very small numbers, the tolerance of 0.001 is just too high
; to produce a correct answer:

; (sqrt 0.00000000000000000000999)
; (sqrt iteration 0) Not good enough: 1.0
; (sqrt iteration 1) Not good enough: 0.5
; (sqrt iteration 2) Not good enough: 0.25
; (sqrt iteration 3) Not good enough: 0.125
; (sqrt iteration 4) Not good enough: 0.0625
; (sqrt iteration 5) Guess is good enough: 0.03125

; (new-sqrt 0.00000000000000000000999)
; (new-sqrt iteration 0) Not good enough: 1.0
; (new-sqrt iteration 1) Not good enough: 0.5
; (new-sqrt iteration 2) Not good enough: 0.25
; (new-sqrt iteration 3) Not good enough: 0.125
; (new-sqrt iteration 4) Not good enough: 0.0625
; (new-sqrt iteration 5) Not good enough: 0.03125
; (new-sqrt iteration 6) Not good enough: 0.015625
; (new-sqrt iteration 7) Not good enough: 0.0078125
; (new-sqrt iteration 8) Not good enough: 0.003906250000000001
; (new-sqrt iteration 9) Not good enough: 0.0019531250000000017
; (new-sqrt iteration 10) Not good enough: 0.0009765625000000035
; (new-sqrt iteration 11) Not good enough: 0.0004882812500000068
; (new-sqrt iteration 12) Not good enough: 0.00024414062500001366
; (new-sqrt iteration 13) Not good enough: 0.0001220703125000273
; (new-sqrt iteration 14) Not good enough: 6.103515625005456e-05
; (new-sqrt iteration 15) Not good enough: 3.051757812510912e-05
; (new-sqrt iteration 16) Not good enough: 1.5258789062718236e-05
; (new-sqrt iteration 17) Not good enough: 7.629394531686471e-06
; (new-sqrt iteration 18) Not good enough: 3.81469726649794e-06
; (new-sqrt iteration 19) Not good enough: 1.9073486345583793e-06
; (new-sqrt iteration 20) Not good enough: 9.536743198980082e-07
; (new-sqrt iteration 21) Not good enough: 4.768371651866412e-07
; (new-sqrt iteration 22) Not good enough: 2.384185930685947e-07
; (new-sqrt iteration 23) Not good enough: 1.192093174848446e-07
; (new-sqrt iteration 24) Not good enough: 5.960470064350944e-08
; (new-sqrt iteration 25) Not good enough: 2.980243412387009e-08
; (new-sqrt iteration 26) Not good enough: 1.4901384665694498e-08
; (new-sqrt iteration 27) Not good enough: 7.451027536595899e-09
; (new-sqrt iteration 28) Not good enough: 3.7261841456352315e-09
; (new-sqrt iteration 29) Not good enough: 1.8644325862771695e-09
; (new-sqrt iteration 30) Not good enough: 9.34895392418851e-10
; (new-sqrt iteration 31) Not good enough: 4.727905399548379e-10
; (new-sqrt iteration 32) Not good enough: 2.4696020217863673e-10
; (new-sqrt iteration 33) Not good enough: 1.4370603205283006e-10
; (new-sqrt iteration 34) Not good enough: 1.0661147347351584e-10
; (new-sqrt iteration 35) Not good enough: 1.0015810484740828e-10
; (new-sqrt iteration 36) Guess is good enough: 9.995020371605262e-11
