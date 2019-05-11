(use my-srfi.1)
(use gauche.test)

(define main
    (lambda (arguments)
        (test-my-srfi-1)))

(define test-my-srfi-1
    (lambda ()
        (test-first)
        (test-second)
        (test-third)
        (test-fourth)
        (test-fifth)))

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

(define test-fourth
    (lambda ()
        (test-start "fourth")
        (test* "fourth" (test-error <error>) (fourth '()))
        (test* "fourth" (test-error <error>) (fourth '(1)))
        (test* "fourth" (test-error <error>) (fourth '(1 2)))
        (test* "fourth" (test-error <error>) (fourth '(1 2 3)))
        (test* "fourth" 4 (fourth '(1 2 3 4)))
        (test* "fourth" 4 (fourth '(1 2 3 4 5)))
        (test* "fourth" (test-error <error>) (fourth '(1 2 3 . 4)))
        (test* "fourth" 4 (fourth '(1 2 3 4 . 5)))
        (test-end)))

(define test-fifth
    (lambda ()
        (test-start "fifth")
        (test* "fifth" (test-error <error>) (fifth '()))
        (test* "fifth" (test-error <error>) (fifth '(1)))
        (test* "fifth" (test-error <error>) (fifth '(1 2)))
        (test* "fifth" (test-error <error>) (fifth '(1 2 3)))
        (test* "fifth" (test-error <error>) (fifth '(1 2 3 4)))
        (test* "fifth" 5 (fifth '(1 2 3 4 5)))
        (test* "fifth" 5 (fifth '(1 2 3 4 5 6)))
        (test* "fifth" (test-error <error>) (fifth '(1 2 3 4 . 5)))
        (test* "fifth" 5 (fifth '(1 2 3 4 5 6)))
        (test-end)))

