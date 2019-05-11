(use my-srfi.internals)
(use gauche.test)

(define main
    (lambda (arguments)
        (test-my-srfi-internals)))

(define test-my-srfi-internals
    (lambda ()
        (test-precondition)
        (test-nth)
        (test-nth-or-default)))

(define test-precondition
    (lambda ()
        (test-start "precondition")
        (test* "precondition" #t (precondition #t "OK"))
        (test* "precondition" (test-error <error>) (precondition #f "NG"))
        (test-end)))

(define test-nth
    (lambda ()
        (test-start "nth")
        (test* "nth" (test-error <error>) (nth '() 0))
        (test* "nth" 0 (nth '(0) 0))
        (test* "nth" (test-error <error>) (nth '(0) 1))
        (test* "nth" 0 (nth '(0 1 2) 0))
        (test* "nth" 1 (nth '(0 1 2) 1))
        (test* "nth" 2 (nth '(0 1 2) 2))
        (test* "nth" (test-error <error>) (nth '(0 1 2) 3))
        (test-end)))

(define test-nth-or-default
    (lambda ()
        (test-start "nth-or-default")
        (test* "nth-or-default" 0 (nth-or-default '(0 1 2) 0 -1))
        (test* "nth-or-default" 1 (nth-or-default '(0 1 2) 1 -1))
        (test* "nth-or-default" 2 (nth-or-default '(0 1 2) 2 -1))
        (test* "nth-or-default" -1 (nth-or-default '(0 1 2) 3 -1))
        (test-end)))

