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
        (test-circular-list)
        (test-iota)
        (test-list-ref)
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
        (test-take!)
        (test-split-at)
        (test-last)
        (test-last-pair)
        (test-length)
        (test-append)
        (test-concatenate)
        (test-reverse)
        (test-append-reverse)
        (test-filter)))

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

(define test-circular-list
    (lambda ()
        (test-start "circular-list")
        (test* "circular-list #1"
            '(1 1)
            (take (circular-list 1) 2))
        (test* "circular-list #2"
            '(1 2 1 2)
            (take (circular-list 1 2) 4))
        (test* "circular-list #3"
            '(1 2 3 1 2 3)
            (take (circular-list 1 2 3) 6))
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

(define test-list-ref
    (lambda ()
        (test-start "list-ref")
        (test* "list-ref when empty list passed #1"
            (test-error <error>)
            (list-ref '() 0))
        (test* "list-ref when non empty list passed #1"
            0
            (list-ref '(0 1 2) 0))
        (test* "list-ref when non empty list passed #2"
            1
            (list-ref '(0 1 2) 1))
        (test* "list-ref when non empty list passed #3"
            2
            (list-ref '(0 1 2) 2))
        (test* "list-ref when non empty list passed #4"
            (test-error <error>)
            (list-ref '(0 1 2) 3))
        (test-end)))

(define test-first
    (lambda ()
        (test-start "first")
        (test* "first when empty list passed #1"
            (test-error <error>)
            (first '()))
        (test* "first when non empty list passed #1"
            1
            (first '(1)))
        (test* "first when non empty list passed #2"
            1
            (first '(1 2)))
        (test* "first when dotted list passed #1"
            1
            (first '(1 . 2)))
        (test-end)))

(define test-second
    (lambda ()
        (test-start "second")
        (test* "second when empty list passed #1"
            (test-error <error>)
            (second '()))
        (test* "second when non empty list passed #1"
            (test-error <error>)
            (second '(1)))
        (test* "second when non empty list passed #2"
            2
            (second '(1 2)))
        (test* "second when non empty list passed #3"
            2
            (second '(1 2 3)))
        (test* "second when dotted list passed #1"
            2
            (second '(1 2 . 3)))
        (test-end)))

(define test-third
    (lambda ()
        (test-start "third")
        (test* "third when empty list passed #1"
            (test-error <error>)
            (third '()))
        (test* "third when non empty list passed #1"
            (test-error <error>)
            (third '(1 2)))
        (test* "third when non empty list passed #2"
            3
            (third '(1 2 3)))
        (test* "third when non empty list passed #3"
            3
            (third '(1 2 3 4)))
        (test* "third when dotted list passed #1"
            3
            (third '(1 2 3 . 4)))
        (test-end)))

(define test-fourth
    (lambda ()
        (test-start "fourth")
        (test* "fourth when empty list passed #1"
            (test-error <error>)
            (fourth '()))
        (test* "fourth when non empty list passed #1"
            (test-error <error>)
            (fourth '(1 2 3)))
        (test* "fourth when non empty list passed #2"
            4
            (fourth '(1 2 3 4)))
        (test* "fourth when non empty list passed #3"
            4
            (fourth '(1 2 3 4 5)))
        (test* "fourth when dotted list passed #1"
            4
            (fourth '(1 2 3 4 . 5)))
        (test-end)))

(define test-fifth
    (lambda ()
        (test-start "fifth")
        (test* "fifth when empty list passed #1"
            (test-error <error>)
            (fifth '()))
        (test* "fifth when non empty list passed #1"
            (test-error <error>)
            (fifth '(1 2 3 4)))
        (test* "fifth when non empty list passed #2"
            5
            (fifth '(1 2 3 4 5)))
        (test* "fifth when non empty list passed #3"
            5
            (fifth '(1 2 3 4 5 6)))
        (test* "fifth when dotted list passed #1"
            5
            (fifth '(1 2 3 4 5 . 6)))
        (test-end)))

(define test-sixth
    (lambda ()
        (test-start "sixth")
        (test* "sixth when empty list passed #1"
            (test-error <error>)
            (sixth '()))
        (test* "sixth when non empty list passed #1"
            (test-error <error>)
            (sixth '(1 2 3 4 5)))
        (test* "sixth when non empty list passed #2"
            6
            (sixth '(1 2 3 4 5 6)))
        (test* "sixth when non empty list passed #3"
            6
            (sixth '(1 2 3 4 5 6 7)))
        (test* "sixth when dotted list passed #1"
            6
            (sixth '(1 2 3 4 5 6 . 7)))
        (test-end)))

(define test-seventh
    (lambda ()
        (test-start "seventh")
        (test* "seventh when empty list passed #1"
            (test-error <error>)
            (seventh '()))
        (test* "seventh when non empty list passed #1"
            (test-error <error>)
            (seventh '(1 2 3 4 5 6)))
        (test* "seventh when non empty list passed #2"
            7
            (seventh '(1 2 3 4 5 6 7)))
        (test* "seventh when non empty list passed #3"
            7
            (seventh '(1 2 3 4 5 6 7 8)))
        (test* "seventh when dotted list passed #1"
            7
            (seventh '(1 2 3 4 5 6 7 . 8)))
        (test-end)))

(define test-eighth
    (lambda ()
        (test-start "eighth")
        (test* "eighth when empty list passed #1"
            (test-error <error>)
            (eighth '()))
        (test* "eighth when non empty list passed #1"
            (test-error <error>)
            (eighth '(1 2 3 4 5 6 7)))
        (test* "eighth when non empty list passed #2"
            8
            (eighth '(1 2 3 4 5 6 7 8)))
        (test* "eighth when non empty list passed #3"
            8
            (eighth '(1 2 3 4 5 6 7 8 9)))
        (test* "eighth when dotted list passed #1"
            8
            (eighth '(1 2 3 4 5 6 7 8 . 9)))
        (test-end)))

(define test-ninth
    (lambda ()
        (test-start "ninth")
        (test* "ninth when empty list passed #1"
            (test-error <error>)
            (ninth '()))
        (test* "ninth when non empty list passed #1"
            (test-error <error>)
            (ninth '(1 2 3 4 5 6 7 8)))
        (test* "ninth when non empty list passed #2"
            9
            (ninth '(1 2 3 4 5 6 7 8 9)))
        (test* "ninth when non empty list passed #3"
            9
            (ninth '(1 2 3 4 5 6 7 8 9 10)))
        (test* "ninth when dotted list passed #1"
            9
            (ninth '(1 2 3 4 5 6 7 8 9 . 10)))
        (test-end)))

(define test-tenth
    (lambda ()
        (test-start "tenth")
        (test* "tenth when empty list passed #1"
            (test-error <error>)
            (tenth '()))
        (test* "tenth when non empty list passed #1"
            (test-error <error>)
            (tenth '(1 2 3 4 5 6 7 8 9)))
        (test* "tenth when non empty list passed #2"
            10
            (tenth '(1 2 3 4 5 6 7 8 9 10)))
        (test* "tenth when non empty list passed #3"
            10
            (tenth '(1 2 3 4 5 6 7 8 9 10 11)))
        (test* "tenth when dotted list passed #1"
            10
            (tenth '(1 2 3 4 5 6 7 8 9 10 . 11)))
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

(define test-take!
    (lambda ()
        (test-start "take!")
        (test* "take! when empty list passed #1"
            (test-error <error>)
            (take! '() -1))
        (test* "take! when empty list passed #2"
            '()
            (take! '() 0))
        (test* "take! when empty list passed #3"
            (test-error <error>)
            (take! '() 1))
        (test* "take! when non empty list passed #1"
            (test-error <error>)
            (take! '(1 2 3) -1))
        (test* "take! when non empty list passed #2"
            '()
            (take! '(1 2 3) 0))
        (test* "take! when non empty list passed #3"
            '(1)
            (take! '(1 2 3) 1))
        (test* "take! when non empty list passed #4"
            '(1 2)
            (take! '(1 2 3) 2))
        (test* "take! when non empty list passed #5"
            '(1 2 3)
            (take! '(1 2 3) 3))
        (test* "take! when non empty list passed #6"
            (test-error <error>)
            (take! '(1 2 3) 4))
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

(define test-last
    (lambda ()
        (test-start "last")
        (test* "last when empty list passed #1"
            (test-error <error>)
            (last '()))
        (test* "last when non empty list passed #1"
            1
            (last '(1)))
        (test* "last when non empty list passed #2"
            2
            (last '(1 2)))
        (test* "last when non empty list passed #3"
            3
            (last '(1 2 3)))
        (test-end)))

(define test-last-pair
    (lambda ()
        (test-start "last-pair")
        (test* "last-pair when empty list passed #1"
            (test-error <error>)
            (last-pair '()))
        (test* "last-pair when non empty list passed #1"
            '(1)
            (last-pair '(1)))
        (test* "last-pair when non empty list passed #2"
            '(2)
            (last-pair '(1 2)))
        (test* "last-pair when non empty list passed #3"
            '(3)
            (last-pair '(1 2 3)))
        (test-end)))

(define test-length
    (lambda ()
        (test-start "length")
        (test* "length #1" 0 (length '()))
        (test* "length #2" 1 (length '(1)))
        (test* "length #3" 2 (length '(1 2)))
        (test* "length #4" 3 (length '(1 2 3)))
        (test-end)))

(define test-append
    (lambda ()
        (test-start "append")
        (test* "append when no list passed #1"
            '()
            (append))
        (test* "append when empty list only passed #1"
            '()
            (append '()))
        (test* "append when empty list only passed #2"
            '()
            (append '() '()))
        (test* "append when empty list only passed #3"
            '()
            (append '() '() '()))
        (test* "append when non empty list only passed #1"
            '(1)
            (append '(1)))
        (test* "append when non empty list only passed #2"
            '(1 2 3)
            (append '(1) '(2 3)))
        (test* "append when non empty list only passed #3"
            '(1 2 3)
            (append '(1 2) '(3)))
        (test* "append when non empty list only passed #4"
            '(1 2 3 4 5 6)
            (append '(1) '(2 3) '(4 5 6)))
        (test* "append when non empty list only passed #5"
            '(1 2 3 4 5 6)
            (append '(1 2 3) '(4) '(5 6)))
        (test* "append when both empty list and non empty list passed #1"
            '(1)
            (append '() '(1)))
        (test* "append when both empty list and non empty list passed #2"
            '(1)
            (append '(1) '()))
        (test* "append when both empty list and non empty list passed #3"
            '(1)
            (append '() '() '(1)))
        (test* "append when both empty list and non empty list passed #4"
            '(1)
            (append '() '(1) '()))
        (test* "append when both empty list and non empty list passed #5"
            '(1)
            (append '(1) '() '()))
        (test-end)))

(define test-concatenate
    (lambda ()
        (test-start "concatenate")
        (test* "concatenate when empty list only passed #1"
            '()
            (concatenate '()))
        (test* "concatenate when empty list only passed #2"
            '()
            (concatenate '(())))
        (test* "concatenate when empty list only passed #3"
            '()
            (concatenate '(() ())))
        (test* "concatenate when empty list only passed #4"
            '()
            (concatenate '(() () ())))
        (test* "concatenate when non empty list only passed #1"
            '(1)
            (concatenate '((1))))
        (test* "concatenate when non empty list only passed #2"
            '(1 2 3)
            (concatenate '((1) (2 3))))
        (test* "concatenate when non empty list only passed #3"
            '(1 2 3)
            (concatenate '((1 2) (3))))
        (test* "concatenate when non empty list only passed #4"
            '(1 2 3 4 5 6)
            (concatenate '((1) (2 3) (4 5 6))))
        (test* "concatenate when non empty list only passed #5"
            '(1 2 3 4 5 6)
            (concatenate '((1 2 3) (4) (5 6))))
        (test* "concatenate when both empty list and non empty list passed #1"
            '(1)
            (concatenate '(() (1))))
        (test* "concatenate when both empty list and non empty list passed #2"
            '(1)
            (concatenate '((1) ())))
        (test* "concatenate when both empty list and non empty list passed #3"
            '(1)
            (concatenate '(() () (1))))
        (test* "concatenate when both empty list and non empty list passed #4"
            '(1)
            (concatenate '(() (1) ())))
        (test* "concatenate when both empty list and non empty list passed #5"
            '(1)
            (concatenate '((1) () ())))
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

(define test-append-reverse
    (lambda ()
        (test-start "append-reverse")
        (test* "append-reverse #1"
            '()
            (append-reverse '() '()))
        (test* "append-reverse #2"
            '(a b c)
            (append-reverse '() '(a b c)))
        (test* "append-reverse #3"
            '(3 2 1)
            (append-reverse '(1 2 3) '()))
        (test* "append-reverse #4"
            '(3 2 1 a b c)
            (append-reverse '(1 2 3) '(a b c)))
        (test-end)))

(define test-filter
    (lambda ()
        (define true (lambda _ #t))
        (define false (lambda _ #f))
        (test-start "filter")
        (test* "filter when empty list passed #1"
            '()
            (filter true '()))
        (test* "filter when empty list passed #2"
            '()
            (filter false '()))
        (test* "filter when non empty list passed #1"
            '(1 2 3 4 5)
            (filter true '(1 2 3 4 5)))
        (test* "filter when non empty list passed #2"
            '()
            (filter false '(1 2 3 4 5)))
        (test* "filter when non empty list passed #3"
            '(1 3 5)
            (filter odd? '(1 2 3 4 5)))
        (test* "filter when non empty list passed #3"
            '(2 4)
            (filter even? '(1 2 3 4 5)))
        (test-end)))

