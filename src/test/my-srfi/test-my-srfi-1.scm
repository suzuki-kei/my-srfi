(use my-srfi.1)
(use gauche.test)

(define main
    (lambda (arguments)
        (test-my-srfi-1)))

(define test-my-srfi-1
    (lambda ()
        (test-first)))

(define test-first
    (lambda ()
        (test-start "first")
        (test* "first" (test-error <error>) (first '()))
        (test* "first" 1 (first '(1)))
        (test* "first" 1 (first '(1 2)))
        (test* "first" 1 (first '(1 2 3)))
        (test* "first" 1 (first '(1 . 2)))
        (test-end)))

