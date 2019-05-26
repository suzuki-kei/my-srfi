(use my-srfi.internals)
(use gauche.test)
(use srfi-1)

(define main
    (lambda (arguments)
        (test-my-srfi-internals)))

(define test-my-srfi-internals
    (lambda ()
        (test-precondition)
        (test-nth)
        (test-nth-or-default)
        (test-classify-list)))

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

(define test-classify-list
    (lambda ()
        (test-start "classify-list")
        (test* "classify-list #1" 'dotted-list (classify-list 1))
        (test* "classify-list #2" 'proper-list (classify-list '()))
        (test* "classify-list #3" 'proper-list (classify-list '(1)))
        (test* "classify-list #4" 'proper-list (classify-list '(1 2)))
        (test* "classify-list #5" 'proper-list (classify-list '(1 2 3)))
        (test* "classify-list #6" 'dotted-list (classify-list '(1 . 2)))
        (test* "classify-list #7" 'dotted-list (classify-list '(1 2 . 3)))
        (test* "classify-list #8" 'circular-list (classify-list (circular-list 1)))
        (test-end)))

