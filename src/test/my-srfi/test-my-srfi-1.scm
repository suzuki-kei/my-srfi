(use my-srfi.1)
(use gauche.test)

(define main
    (lambda (arguments)
        (test-my-srfi-1)))

(define test-my-srfi-1
    (lambda ()
        (test-list)
        (test-xcons)
        (test-cons*)
        (test-make-list)
        (test-list-tabulate)
        (test-list-copy)
        (test-iota)
        (test-reverse)
        (test-first)
        (test-second)
        (test-third)
        (test-fourth)
        (test-fifth)
        (test-sixth)
        (test-seventh)
        (test-eighth)
        (test-ninth)
        (test-tenth)
        (test-car+cdr)
        (test-take)
        (test-drop)
        (test-take-right)
        (test-drop-right)
        (test-split-at)))

(define test-list
    (lambda ()
        (test-start "list")
        (test* "list #1" '() (list))
        (test* "list #2" '(1) (list 1))
        (test* "list #3" '(1 2) (list 1 2))
        (test* "list #4" '(1 2 3) (list 1 2 3))
        (test-end)))

(define test-xcons
    (lambda ()
        (test-start "xcons")
        (test* "xcons #1" '(1) (xcons '() 1))
        (test* "xcons #2" '(1 2) (xcons '(2) 1))
        (test* "xcons #3" '(1 2 3) (xcons '(2 3) 1))
        (test-end)))

(define test-cons*
    (lambda ()
        (test-start "cons*")
        (test* "cons* #1" (test-error <error>) (cons*))
        (test* "cons* #2" 1 (cons* 1))
        (test* "cons* #3" '(1 . 2) (cons* 1 2))
        (test* "cons* #4" '(1 2 . 3) (cons* 1 2 3))
        (test* "cons* #5" '(1 2 3) (cons* 1 2 3 '()))
        (test-end)))

(define test-make-list
    (lambda ()
        (test-start "make-list")
        (test* "make-list when `fill-value` not passed #1"
            (test-error <error>)
            (make-list -1))
        (test* "make-list when `fill-value` not passed #2"
            '()
            (make-list 0))
        (test* "make-list when `fill-value` not passed #3"
            '(#f)
            (make-list 1))
        (test* "make-list when `fill-value` not passed #4"
            '(#f #f)
            (make-list 2))
        (test* "make-list when `fill-value` not passed #5"
            '(#f #f #f)
            (make-list 3))
        (test* "make-list when `fill-value` passed #1"
            (test-error <error>)
            (make-list -1 'a))
        (test* "make-list when `fill-value` passed #2"
            '()
            (make-list 0 'a))
        (test* "make-list when `fill-value` passed #3"
            '(a)
            (make-list 1 'a))
        (test* "make-list when `fill-value` passed #4"
            '(a a)
            (make-list 2 'a))
        (test* "make-list when `fill-value` passed #5"
            '(a a a)
            (make-list 3 'a))
        (test-end)))

(define test-list-tabulate
    (lambda ()
        (test-start "list-tabulate")
        (test* "list-tabulate #1"
            (test-error <error>)
            (list-tabulate -1 values))
        (test* "list-tabulate #2"
            '()
            (list-tabulate 0 values))
        (test* "list-tabulate #3"
            '(0)
            (list-tabulate 1 values))
        (test* "list-tabulate #4"
            '(0 1)
            (list-tabulate 2 values))
        (test* "list-tabulate #5"
            '(0 1 2)
            (list-tabulate 3 values))
        (test-end)))

(define test-list-copy
    (lambda ()
        (test-start "list-copy")
        (test* "list-copy #1" '() (list-copy '()))
        (test* "list-copy #2" '(1) (list-copy '(1)))
        (test* "list-copy #3" '(1 2) (list-copy '(1 2)))
        (test* "list-copy #4" '(1 2 3) (list-copy '(1 2 3)))
        (test-end)))

(define test-iota
    (lambda ()
        (test-start "iota")
        (test* "iota when `count` passed only #1"
            '()
            (iota 0))
        (test* "iota when `count` passed only #2"
            '(0)
            (iota 1))
        (test* "iota when `count` passed only #3"
            '(0 1)
            (iota 2))
        (test* "iota when `count` passed only #1"
            '(0 1 2)
            (iota 3))
        (test* "iota when `start` passed #1"
            '()
            (iota 0 1))
        (test* "iota when `start` passed #2"
            '(1)
            (iota 1 1))
        (test* "iota when `start` passed #3"
            '(1 2)
            (iota 2 1))
        (test* "iota when `start` passed #4"
            '(1 2 3)
            (iota 3 1))
        (test* "iota when `step` is positive #1"
            '()
            (iota 0 1 2))
        (test* "iota when `step` is positive #2"
            '(0)
            (iota 1 0 2))
        (test* "iota when `step` is positive #3"
            '(0 2)
            (iota 2 0 2))
        (test* "iota when `step` is positive #4"
            '(0 2 4)
            (iota 3 0 2))
        (test* "iota when `step` is negative #1"
            '()
            (iota 0 0 -1))
        (test* "iota when `step` is negative #2"
            '(0)
            (iota 1 0 -1))
        (test* "iota when `step` is negative #3"
            '(0 -1)
            (iota 2 0 -1))
        (test* "iota when `step` is negative #4"
            '(0 -1 -2)
            (iota 3 0 -1))
        (test-end)))

(define test-reverse
    (lambda ()
        (test-start "reverse")
        (test* "reverse when empty list passed #1"
            '()
            (reverse '()))
        (test* "reverse when non empty list passed #1"
            '(1)
            (reverse '(1)))
        (test* "reverse when non empty list passed #2"
            '(2 1)
            (reverse '(1 2)))
        (test* "reverse when non empty list passed #3"
            '(3 2 1)
            (reverse '(1 2 3)))
        (test* "reverse when nested list passed #1"
            '((e (f)) d (b c) a)
            (reverse '(a (b c) d (e (f)))))
        (test-end)))

(define test-first
    (lambda ()
        (test-start "first")
        (test* "first #1" (test-error <error>) (first '()))
        (test* "first #2" 1 (first '(1)))
        (test* "first #3" 1 (first '(1 2)))
        (test* "first #4" 1 (first '(1 2 3)))
        (test* "first #5" 1 (first '(1 . 2)))
        (test-end)))

(define test-second
    (lambda ()
        (test-start "second")
        (test* "second #1" (test-error <error>) (second '()))
        (test* "second #2" (test-error <error>) (second '(1)))
        (test* "second #3" 2 (second '(1 2)))
        (test* "second #4" 2 (second '(1 2 3)))
        (test* "second #5" (test-error <error>) (second '(1 . 2)))
        (test* "second #6" 2 (second '(1 2 . 3)))
        (test-end)))

(define test-third
    (lambda ()
        (test-start "third")
        (test* "third #1" (test-error <error>) (third '()))
        (test* "third #2" (test-error <error>) (third '(1)))
        (test* "third #3" (test-error <error>) (third '(1 2)))
        (test* "third #4" 3 (third '(1 2 3)))
        (test* "third #5" 3 (third '(1 2 3 4)))
        (test* "third #6" (test-error <error>) (third '(1 2 . 3)))
        (test* "third #7" 3 (third '(1 2 3 . 4)))
        (test-end)))

(define test-fourth
    (lambda ()
        (test-start "fourth")
        (test* "fourth #1" (test-error <error>) (fourth '()))
        (test* "fourth #2" (test-error <error>) (fourth '(1)))
        (test* "fourth #3" (test-error <error>) (fourth '(1 2)))
        (test* "fourth #4" (test-error <error>) (fourth '(1 2 3)))
        (test* "fourth #5" 4 (fourth '(1 2 3 4)))
        (test* "fourth #6" 4 (fourth '(1 2 3 4 5)))
        (test* "fourth #7" (test-error <error>) (fourth '(1 2 3 . 4)))
        (test* "fourth #8" 4 (fourth '(1 2 3 4 . 5)))
        (test-end)))

(define test-fifth
    (lambda ()
        (test-start "fifth")
        (test* "fifth #1" (test-error <error>) (fifth '()))
        (test* "fifth #2" (test-error <error>) (fifth '(1)))
        (test* "fifth #3" (test-error <error>) (fifth '(1 2)))
        (test* "fifth #4" (test-error <error>) (fifth '(1 2 3)))
        (test* "fifth #5" (test-error <error>) (fifth '(1 2 3 4)))
        (test* "fifth #6" 5 (fifth '(1 2 3 4 5)))
        (test* "fifth #7" 5 (fifth '(1 2 3 4 5 6)))
        (test* "fifth #8" (test-error <error>) (fifth '(1 2 3 4 . 5)))
        (test* "fifth #9" 5 (fifth '(1 2 3 4 5 6)))
        (test-end)))

(define test-sixth
    (lambda ()
        (test-start "sixth")
        (test* "sixth #1" (test-error <error>) (sixth '()))
        (test* "sixth #2" (test-error <error>) (sixth '(1)))
        (test* "sixth #3" (test-error <error>) (sixth '(1 2)))
        (test* "sixth #4" (test-error <error>) (sixth '(1 2 3)))
        (test* "sixth #5" (test-error <error>) (sixth '(1 2 3 4)))
        (test* "sixth #6" (test-error <error>) (sixth '(1 2 3 4 5)))
        (test* "sixth #7" 6 (sixth '(1 2 3 4 5 6)))
        (test* "sixth #8" 6 (sixth '(1 2 3 4 5 6 7)))
        (test* "sixth #9" (test-error <error>) (sixth '(1 2 3 4 5 . 6)))
        (test* "sixth #10" 6 (sixth '(1 2 3 4 5 6 . 7)))
        (test-end)))

(define test-seventh
    (lambda ()
        (test-start "seventh")
        (test* "seventh #1" (test-error <error>) (seventh '()))
        (test* "seventh #2" (test-error <error>) (seventh '(1)))
        (test* "seventh #3" (test-error <error>) (seventh '(1 2)))
        (test* "seventh #4" (test-error <error>) (seventh '(1 2 3)))
        (test* "seventh #5" (test-error <error>) (seventh '(1 2 3 4)))
        (test* "seventh #6" (test-error <error>) (seventh '(1 2 3 4 5)))
        (test* "seventh #7" (test-error <error>) (seventh '(1 2 3 4 5 6)))
        (test* "seventh #8" 7 (seventh '(1 2 3 4 5 6 7)))
        (test* "seventh #9" 7 (seventh '(1 2 3 4 5 6 7 8)))
        (test* "seventh #10" (test-error <error>) (seventh '(1 2 3 4 5 6 . 7)))
        (test* "seventh #11" 7 (seventh '(1 2 3 4 5 6 7 . 8)))
        (test-end)))

(define test-eighth
    (lambda ()
        (test-start "eighth")
        (test* "eighth #1" (test-error <error>) (eighth '()))
        (test* "eighth #2" (test-error <error>) (eighth '(1)))
        (test* "eighth #3" (test-error <error>) (eighth '(1 2)))
        (test* "eighth #4" (test-error <error>) (eighth '(1 2 3)))
        (test* "eighth #5" (test-error <error>) (eighth '(1 2 3 4)))
        (test* "eighth #6" (test-error <error>) (eighth '(1 2 3 4 5)))
        (test* "eighth #7" (test-error <error>) (eighth '(1 2 3 4 5 6)))
        (test* "eighth #8" (test-error <error>) (eighth '(1 2 3 4 5 6 7)))
        (test* "eighth #9" 8 (eighth '(1 2 3 4 5 6 7 8)))
        (test* "eighth #10" 8 (eighth '(1 2 3 4 5 6 7 8 9)))
        (test* "eighth #11" (test-error <error>) (eighth '(1 2 3 4 5 6 7 . 8)))
        (test* "eighth #12" 8 (eighth '(1 2 3 4 5 6 7 8 . 9)))
        (test-end)))

(define test-ninth
    (lambda ()
        (test-start "ninth")
        (test* "ninth #1" (test-error <error>) (ninth '()))
        (test* "ninth #2" (test-error <error>) (ninth '(1)))
        (test* "ninth #3" (test-error <error>) (ninth '(1 2)))
        (test* "ninth #4" (test-error <error>) (ninth '(1 2 3)))
        (test* "ninth #5" (test-error <error>) (ninth '(1 2 3 4)))
        (test* "ninth #6" (test-error <error>) (ninth '(1 2 3 4 5)))
        (test* "ninth #7" (test-error <error>) (ninth '(1 2 3 4 5 6)))
        (test* "ninth #8" (test-error <error>) (ninth '(1 2 3 4 5 6 7)))
        (test* "ninth #9" (test-error <error>) (ninth '(1 2 3 4 5 6 7 8)))
        (test* "ninth #10" 9 (ninth '(1 2 3 4 5 6 7 8 9)))
        (test* "ninth #11" (test-error <error>) (ninth '(1 2 3 4 5 6 7 8 . 9)))
        (test* "ninth #12" 9 (ninth '(1 2 3 4 5 6 7 8 9 . 10)))
        (test-end)))

(define test-tenth
    (lambda ()
        (test-start "tenth")
        (test* "tenth #1" (test-error <error>) (tenth '()))
        (test* "tenth #2" (test-error <error>) (tenth '(1)))
        (test* "tenth #3" (test-error <error>) (tenth '(1 2)))
        (test* "tenth #4" (test-error <error>) (tenth '(1 2 3)))
        (test* "tenth #5" (test-error <error>) (tenth '(1 2 3 4)))
        (test* "tenth #6" (test-error <error>) (tenth '(1 2 3 4 5)))
        (test* "tenth #7" (test-error <error>) (tenth '(1 2 3 4 5 6)))
        (test* "tenth #8" (test-error <error>) (tenth '(1 2 3 4 5 6 7)))
        (test* "tenth #9" (test-error <error>) (tenth '(1 2 3 4 5 6 7 8)))
        (test* "tenth #10" (test-error <error>) (tenth '(1 2 3 4 5 6 7 8 9)))
        (test* "tenth #11" 10 (tenth '(1 2 3 4 5 6 7 8 9 10)))
        (test* "tenth #12" 10 (tenth '(1 2 3 4 5 6 7 8 9 10 11)))
        (test* "tenth #13" (test-error <error>) (tenth '(1 2 3 4 5 6 7 8 9 . 10)))
        (test* "tenth #14" 10 (tenth '(1 2 3 4 5 6 7 8 9 10 . 11)))
        (test-end)))

(define test-car+cdr
    (lambda ()
        (test-start "car+cdr")
        (test* "car+cdr #1"
            (test-error <error>)
            (receive xs (car+cdr '()) xs))
        (test* "car+cdr #2"
            '(1 ())
            (receive xs (car+cdr '(1)) xs))
        (test* "car+cdr #3"
            '(1 (2))
            (receive xs (car+cdr '(1 2)) xs))
        (test* "car+cdr #4"
            '(1 (2 3))
            (receive xs (car+cdr '(1 2 3)) xs))
        (test-end)))

(define test-take
    (lambda ()
        (test-start "take")
        (test* "take when empty list passed #1"
            (test-error <error>)
            (take '() -1))
        (test* "take when empty list passed #2"
            '()
            (take '() 0))
        (test* "take when empty list passed #3"
            (test-error <error>)
            (take '() 1))
        (test* "take when non empty list passed #1"
            (test-error <error>)
            (take '(1 2 3) -1))
        (test* "take when non empty list passed #2"
            '()
            (take '(1 2 3) 0))
        (test* "take when non empty list passed #3"
            '(1)
            (take '(1 2 3) 1))
        (test* "take when non empty list passed #4"
            '(1 2)
            (take '(1 2 3) 2))
        (test* "take when non empty list passed #5"
            '(1 2 3)
            (take '(1 2 3) 3))
        (test* "take when non empty list passed #6"
            (test-error <error>)
            (take '(1 2 3) 4))
        (test-end)))

(define test-drop
    (lambda ()
        (test-start "drop")
        (test* "drop when empty list passed #1"
            (test-error <error>)
            (drop '() -1))
        (test* "drop when empty list passed #2"
            '()
            (drop '() 0))
        (test* "drop when empty list passed #3"
            (test-error <error>)
            (drop '() 1))
        (test* "drop when non empty list passed #1"
            (test-error <error>)
            (drop '(1 2 3) -1))
        (test* "drop when non empty list passed #2"
            '(1 2 3)
            (drop '(1 2 3) 0))
        (test* "drop when non empty list passed #3"
            '(2 3)
            (drop '(1 2 3) 1))
        (test* "drop when non empty list passed #4"
            '(3)
            (drop '(1 2 3) 2))
        (test* "drop when non empty list passed #5"
            '()
            (drop '(1 2 3) 3))
        (test* "drop when non empty list passed #6"
            (test-error <error>)
            (drop '(1 2 3) 4))
        (test-end)))

(define test-take-right
    (lambda ()
        (test-start "take-right")
        (test* "take-right when empty list passed #1"
            (test-error <error>)
            (take-right '() -1))
        (test* "take-right when empty list passed #2"
            '()
            (take-right '() 0))
        (test* "take-right when empty list passed #3"
            (test-error <error>)
            (take-right '() 1))
        (test* "take-right when non empty list passed #1"
            '()
            (take-right '(1 2 3) 0))
        (test* "take-right when non empty list passed #2"
            '(3)
            (take-right '(1 2 3) 1))
        (test* "take-right when non empty list passed #3"
            '(2 3)
            (take-right '(1 2 3) 2))
        (test* "take-right when non empty list passed #4"
            '(1 2 3)
            (take-right '(1 2 3) 3))
        (test* "take-right when non empty list passed #5"
            (test-error <error>)
            (take-right '(1 2 3) 4))
        (test-end)))

(define test-drop-right
    (lambda ()
        (test-start "drop-right")
        (test* "drop-right when empty list passed #1"
            (test-error <error>)
            (drop-right '() -1))
        (test* "drop-right when empty list passed #2"
            '()
            (drop-right '() 0))
        (test* "drop-right when non empty list passed #1"
            '(1 2 3)
            (drop-right '(1 2 3) 0))
        (test* "drop-right when non empty list passed #2"
            '(1 2)
            (drop-right '(1 2 3) 1))
        (test* "drop-right when non empty list passed #3"
            '(1)
            (drop-right '(1 2 3) 2))
        (test* "drop-right when non empty list passed #4"
            '()
            (drop-right '(1 2 3) 3))
        (test* "drop-right when non empty list passed #5"
            (test-error <error>)
            (drop-right '(1 2 3) 4))
        (test-end)))

(define test-split-at
    (lambda ()
        (test-start "split-at")
        (test* "split-at when empty list passed #1"
            (test-error <error>)
            (receive xs (split-at '() -1) xs))
        (test* "split-at when empty list passed #2"
            '(() ())
            (receive xs (split-at '() 0) xs))
        (test* "split-at when non empty list passed #1"
            (test-error <error>)
            (receive xs (split-at '(1 2 3) -1) xs))
        (test* "split-at when non empty list passed #2"
            '(() (1 2 3))
            (receive xs (split-at '(1 2 3) 0) xs))
        (test* "split-at when non empty list passed #3"
            '((1) (2 3))
            (receive xs (split-at '(1 2 3) 1) xs))
        (test* "split-at when non empty list passed #4"
            '((1 2) (3))
            (receive xs (split-at '(1 2 3) 2) xs))
        (test* "split-at when non empty list passed #5"
            '((1 2 3) ())
            (receive xs (split-at '(1 2 3) 3) xs))
        (test* "split-at when non empty list passed #6"
            (test-error <error>)
            (receive xs (split-at '(1 2 3) 4) xs))
        (test-end)))

