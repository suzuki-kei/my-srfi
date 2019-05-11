(use my-srfi.1)
(use gauche.test)

(define main
    (lambda (arguments)
        (test-my-srfi-1)))

(define test-my-srfi-1
    (lambda ()
        (test-first)
        (test-second)
        (test-third)))

(define test-first
    (lambda ()
        (test-start "first")
        (test* "first" (test-error <error>) (first '()))
        (test* "first" 1 (first '(1)))
        (test* "first" 1 (first '(1 2)))
        (test* "first" 1 (first '(1 2 3)))
        (test* "first" 1 (first '(1 . 2)))
        (test-end)))

(define test-second
    (lambda ()
        (test-start "second")
        (test* "second" (test-error <error>) (second '()))
        (test* "second" (test-error <error>) (second '(1)))
        (test* "second" 2 (second '(1 2)))
        (test* "second" 2 (second '(1 2 3)))
        (test* "second" (test-error <error>) (second '(1 . 2)))
        (test* "second" 2 (second '(1 2 . 3)))
        (test-end)))

(define test-third
    (lambda ()
        (test-start "third")
        (test* "third" (test-error <error>) (third '()))
        (test* "third" (test-error <error>) (third '(1)))
        (test* "third" (test-error <error>) (third '(1 2)))
        (test* "third" 3 (third '(1 2 3)))
        (test* "third" 3 (third '(1 2 3 4)))
        (test* "third" (test-error <error>) (third '(1 2 . 3)))
        (test* "third" 3 (third '(1 2 3 . 4)))
        (test-end)))

