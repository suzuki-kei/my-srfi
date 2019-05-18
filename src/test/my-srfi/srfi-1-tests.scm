(use gauche.test)

(define test
    (lambda ()
        (test-list)
        (test-xcons)
        (test-cons*)
        (test-make-list)
        (test-list-tabulate)
        (test-list-copy)
        (test-circular-list)
        (test-iota)
        (test-caar)
        (test-cadr)
        (test-cdar)
        (test-cddr)
        (test-caaar)
        (test-caadr)
        (test-cadar)
        (test-caddr)
        (test-cdaar)
        (test-cdadr)
        (test-cddar)
        (test-cdddr)
        (test-caaaar)
        (test-caaadr)
        (test-caadar)
        (test-caaddr)
        (test-cadaar)
        (test-cadadr)
        (test-caddar)
        (test-cadddr)
        (test-cdaaar)
        (test-cdaadr)
        (test-cdadar)
        (test-cdaddr)
        (test-cddaar)
        (test-cddadr)
        (test-cdddar)
        (test-cddddr)
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
        (test-filter)
        (test-partition)
        (test-remove)
        (test-filter!)
        (test-any)
        (test-every)))

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
        (test* "cons* #1" 1 (cons* 1))
        (test* "cons* #2" '(1 . 2) (cons* 1 2))
        (test* "cons* #3" '(1 2 . 3) (cons* 1 2 3))
        (test* "cons* #4" '(1 2 3) (cons* 1 2 3 '()))
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
        (test* "iota when `count` passed only #4"
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

(define test-caar
    (lambda ()
        (test-start "caar")
        (test* "caar #1" '(caar) (caar '(((caar)))))
        (test-end)))

(define test-cadr
    (lambda ()
        (test-start "cadr")
        (test* "cadr #1" '(cadr) (cadr '(() (cadr))))
        (test-end)))

(define test-cdar
    (lambda ()
        (test-start "cdar")
        (test* "cdar #1" '(cdar) (cdar '((() cdar))))
        (test-end)))

(define test-cddr
    (lambda ()
        (test-start "cddr")
        (test* "cddr #1" '(cddr) (cddr '(() () cddr)))
        (test-end)))

(define test-caaar
    (lambda ()
        (test-start "caaar")
        (test* "caaar #1" '(caaar) (caaar '((((caaar))))))
        (test-end)))

(define test-caadr
    (lambda ()
        (test-start "caadr")
        (test* "caadr #1" '(caadr) (caadr '(() ((caadr)))))
        (test-end)))

(define test-cadar
    (lambda ()
        (test-start "cadar")
        (test* "cadar #1" '(cadar) (cadar '((() (cadar)))))
        (test-end)))

(define test-caddr
    (lambda ()
        (test-start "caddr")
        (test* "caddr #1" '(caddr) (caddr '(() () (caddr))))
        (test-end)))

(define test-cdaar
    (lambda ()
        (test-start "cdaar")
        (test* "cdaar #1" '(cdaar) (cdaar '(((() cdaar)))))
        (test-end)))

(define test-cdadr
    (lambda ()
        (test-start "cdadr")
        (test* "cdadr #1" '(cdadr) (cdadr '(() (() cdadr))))
        (test-end)))

(define test-cddar
    (lambda ()
        (test-start "cddar")
        (test* "cddar #1" '(cddar) (cddar '((() () cddar))))
        (test-end)))

(define test-cdddr
    (lambda ()
        (test-start "cdddr")
        (test* "cdddr #1" '(cdddr) (cdddr '(() () () cdddr)))
        (test-end)))

(define test-caaaar
    (lambda ()
        (test-start "caaaar")
        (test* "caaaar #1" '(caaaar) (caaaar '(((((caaaar)))))))
        (test-end)))

(define test-caaadr
    (lambda ()
        (test-start "caaadr")
        (test* "caaadr #1" '(caaadr) (caaadr '(() (((caaadr))))))
        (test-end)))

(define test-caadar
    (lambda ()
        (test-start "caadar")
        (test* "caadar #1" '(caadar) (caadar '((() ((caadar))))))
        (test-end)))

(define test-caaddr
    (lambda ()
        (test-start "caaddr")
        (test* "caaddr #1" '(caaddr) (caaddr '(() () ((caaddr)))))
        (test-end)))

(define test-cadaar
    (lambda ()
        (test-start "cadaar")
        (test* "cadaar #1" '(cadaar) (cadaar '(((() (cadaar))))))
        (test-end)))

(define test-cadadr
    (lambda ()
        (test-start "cadadr")
        (test* "cadadr #1" '(cadadr) (cadadr '(() (() (cadadr)))))
        (test-end)))

(define test-caddar
    (lambda ()
        (test-start "caddar")
        (test* "caddar #1" '(caddar) (caddar '((() () (caddar)))))
        (test-end)))

(define test-cadddr
    (lambda ()
        (test-start "cadddr")
        (test* "cadddr #1" '(cadddr) (cadddr '(() () () (cadddr))))
        (test-end)))

(define test-cdaaar
    (lambda ()
        (test-start "cdaaar")
        (test* "cdaaar #1" '(cdaaar) (cdaaar '((((() cdaaar))))))
        (test-end)))

(define test-cdaadr
    (lambda ()
        (test-start "cdaadr")
        (test* "cdaadr #1" '(cdaadr) (cdaadr '(() ((() cdaadr)))))
        (test-end)))

(define test-cdadar
    (lambda ()
        (test-start "cdadar")
        (test* "cdadar #1" '(cdadar) (cdadar '((() (() cdadar)))))
        (test-end)))

(define test-cdaddr
    (lambda ()
        (test-start "cdaddr")
        (test* "cdaddr #1" '(cdaddr) (cdaddr '(() () (() cdaddr))))
        (test-end)))

(define test-cddaar
    (lambda ()
        (test-start "cddaar")
        (test* "cddaar #1" '(cddaar) (cddaar '(((() () cddaar)))))
        (test-end)))

(define test-cddadr
    (lambda ()
        (test-start "cddadr")
        (test* "cddadr #1" '(cddadr) (cddadr '(() (() () cddadr))))
        (test-end)))

(define test-cdddar
    (lambda ()
        (test-start "cdddar")
        (test* "cdddar #1" '(cdddar) (cdddar '((() () () cdddar))))
        (test-end)))

(define test-cddddr
    (lambda ()
        (test-start "cddddr")
        (test* "cddddr #1" '(cddddr) (cddddr '(() () () () cddddr)))
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
        (test* "filter when non empty list passed #4"
            '(2 4)
            (filter even? '(1 2 3 4 5)))
        (test-end)))

(define test-partition
    (lambda ()
        (test-start "partition")
        (test* "partition when empty list passed #1"
            '(() ())
            (receive xs (partition odd? '()) xs))
        (test* "partition when non empty list passed #1"
            '((1 3 5) (2 4))
            (receive xs (partition odd? '(1 2 3 4 5)) xs))
        (test-end)))

(define test-remove
    (lambda ()
        (test-start "remove")
        (test* "remove when empty list passed #1"
            '()
            (remove odd? '()))
        (test* "remove when non empty list passed #1"
            '(2 4)
            (remove odd? '(1 2 3 4 5)))
        (test-end)))

(define test-filter!
    (lambda ()
        (define true (lambda _ #t))
        (define false (lambda _ #f))
        (test-start "filter!")
        (test* "filter! when empty list passed #1"
            '()
            (filter! true '()))
        (test* "filter! when empty list passed #2"
            '()
            (filter! false '()))
        (test* "filter! when non empty list passed #1"
            '(1 2 3 4 5)
            (filter! true '(1 2 3 4 5)))
        (test* "filter! when non empty list passed #2"
            '()
            (filter! false '(1 2 3 4 5)))
        (test* "filter! when non empty list passed #3"
            '(1 3 5)
            (filter! odd? '(1 2 3 4 5)))
        (test* "filter! when non empty list passed #4"
            '(2 4)
            (filter! even? '(1 2 3 4 5)))
        (test-end)))

(define test-any
    (lambda ()
        (test-start "any")
        (test* "any when predicate will not called #1"
            #f
            (any odd? '()))
        (test* "any when predicate will not called #2"
            #f
            (any odd? '() '()))
        (test* "any when predicate will not called #3"
            #f
            (any odd? '() '() '()))
        (test* "any when predicate will called #1"
            #f
            (any odd? '(0 2 4)))
        (test* "any when predicate will called #2"
            #t
            (any even? '(0 2 4)))
        (test* "any when predicate will called #3"
            #f
            (any = '(0 2 4) '(1 3 5)))
        (test* "any when predicate will called #4"
            #f
            (any = '(0 0 0) '(1 2 3)))
        (test* "any when predicate will called #5"
            #t
            (any = '(1 0 0) '(1 2 3)))
        (test* "any when predicate will called #6"
            #t
            (any = '(0 2 0) '(1 2 3)))
        (test* "any when predicate will called #7"
            #t
            (any = '(0 0 3) '(1 2 3)))
        (test-end)))

(define test-every
    (lambda ()
        (test-start "every")
        (test* "every when predicate will not called #1"
            #t
            (every odd? '()))
        (test* "every when predicate will not called #2"
            #t
            (every odd? '() '()))
        (test* "every when predicate will not called #3"
            #t
            (every odd? '() '() '()))
        (test* "every when predicate will called #1"
            #t
            (every odd? '(1 3 5)))
        (test* "every when predicate will called #2"
            #f
            (every odd? '(0 2 4)))
        (test* "every when predicate will called #3"
            #t
            (every = '(0 0 0) '(0 0 0)))
        (test* "every when predicate will called #4"
            #f
            (every = '(0 0 0) '(0 0 1)))
        (test* "every when predicate will called #5"
            #f
            (every = '(0 0 0) '(0 1 0)))
        (test* "every when predicate will called #6"
            #f
            (every = '(0 0 0) '(1 0 0)))
        (test* "every when predicate will called #7"
            #f
            (every = '(0 0 0) '(1 1 1)))
        (test-end)))

