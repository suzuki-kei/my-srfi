(use my-srfi.internals)
(use gauche.test)

(define main
    (lambda (arguments)
        (test-my-srfi-internals)))

(define test-my-srfi-internals
    (lambda ()
        (test-precondition)))

(define test-precondition
    (lambda ()
        (test-start "precondition")
        (test* "precondition" #t (precondition #t "OK"))
        (test* "precondition" (test-error <error>) (precondition #f "NG"))
        (test-end)))

