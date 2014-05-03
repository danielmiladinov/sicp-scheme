; Here is an alternative procedural representation of pairs. For this representation,
; verify that (car (cons x y)) yields x for any objects x and y.
; (define (cons x y) (lambda (m) (m x y)))
; (define (car z) (z (lambda (p q) p)))
; What is the corresponding definition of cdr? (Hint: To verify that this works,
; make use of the substitution model of Section 1.1.5.)

(define (assert-equal x y) (if (= x y) "ok" "not ok"))

(define (my-cons x y) (lambda (m) (m x y)))
(define (my-car z) (z (lambda (p q) p)))
(define (my-cdr z) (z (lambda (p q) q)))

(define x       (cons 1 2))
(define my-x (my-cons 1 2))

(define y       (cons 3 4))
(define my-y (my-cons 3 4))

(assert-equal (car x) (my-car my-x))
(assert-equal (cdr x) (my-cdr my-x))

(assert-equal (car y) (my-car my-y))
(assert-equal (cdr y) (my-cdr my-y))

; => "ok"
; => "ok"
; => "ok"
; => "ok"
