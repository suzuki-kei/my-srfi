;;
;; SRFI-1 List Library
;;

(define-library (my-srfi 1)

    (import
        (only (scheme base)
            +
            -
            =
            >=
            apply
            caar
            cadr
            car
            cdar
            cddr
            cdr
            cond
            cons
            define
            else
            lambda
            let
            map
            not
            null?
            quote
            set!
            set-cdr!
            values)
        (prefix (my-srfi internals) internals:))

    (export
        list
        xcons
        cons*
        make-list
        list-tabulate
        list-copy
        circular-list
        iota
        caar
        cadr
        cdar
        cddr
        caaar
        caadr
        cadar
        caddr
        cdaar
        cdadr
        cddar
        cdddr
        caaaar
        caaadr
        caadar
        caaddr
        cadaar
        cadadr
        caddar
        cadddr
        cdaaar
        cdaadr
        cdadar
        cdaddr
        cddaar
        cddadr
        cdddar
        cddddr
        list-ref
        first
        second
        third
        fourth
        fifth
        sixth
        seventh
        eighth
        ninth
        tenth
        car+cdr
        take
        drop
        take-right
        drop-right
        take!
        split-at
        last
        last-pair
        length
        append
        concatenate
        reverse
        append-reverse
        filter
        partition
        remove
        filter!
        any
        every)

    (begin

        (define list
            (lambda xs
                xs))

        (define xcons
            (lambda (xs x)
                (cons x xs)))

        (define cons*
            (lambda (x . xs)
                (cond
                    ((null? xs)
                        x)
                    (else
                        (cons
                            x
                            (apply
                                cons*
                                (cons (car xs) (cdr xs))))))))

        (define make-list
            (lambda (n . optionals)
                (define make-list
                    (lambda (xs n x)
                        (cond
                            ((= n 0)
                                xs)
                            (else
                                (make-list
                                    (cons x xs)
                                    (- n 1)
                                    x)))))
                (internals:precondition
                    (>= n 0)
                    "`n` must be greater than or equals to 0")
                (let ((fill-value (internals:nth-or-default optionals 0 #f)))
                    (make-list '() n fill-value))))

        (define list-tabulate
            (lambda (n init-proc)
                (define list-tabulate
                    (lambda (xs i n init-proc)
                        (cond
                            ((= n 0)
                                xs)
                            (else
                                (list-tabulate
                                    (cons (init-proc i) xs)
                                    (+ i 1)
                                    (- n 1)
                                    init-proc)))))
                (internals:precondition
                    (>= n 0)
                    "`n` must be greater than or equals to 0")
                (reverse
                    (list-tabulate
                        '()
                        0
                        n
                        init-proc))))

        (define list-copy
            (lambda (xs)
                (cond
                    ((null? xs)
                        '())
                    (else
                        (cons
                            (car xs)
                            (list-copy (cdr xs)))))))

        (define circular-list
            (lambda (x . xs)
                (let ((ys (cons x xs)))
                    (set-cdr! (last-pair ys) ys)
                    ys)))

        (define iota
            (lambda (count . optionals)
                (define iota
                    (lambda (xs count start step)
                        (cond
                            ((= count 0)
                                xs)
                            (else
                                (iota
                                    (cons start xs)
                                    (- count 1)
                                    (+ start step)
                                    step)))))
                (let ((start (internals:nth-or-default optionals 0 0))
                      (step (internals:nth-or-default optionals 1 1)))
                    (reverse
                        (iota '() count start step)))))

        (define caar
            (lambda (x)
                (car (car x))))

        (define cadr
            (lambda (x)
                (car (cdr x))))

        (define cdar
            (lambda (x)
                (cdr (car x))))

        (define cddr
            (lambda (x)
                (cdr (cdr x))))

        (define caaar
            (lambda (x)
                (car (car (car x)))))

        (define caadr
            (lambda (x)
                (car (car (cdr x)))))

        (define cadar
            (lambda (x)
                (car (cdr (car x)))))

        (define caddr
            (lambda (x)
                (car (cdr (cdr x)))))

        (define cdaar
            (lambda (x)
                (cdr (car (car x)))))

        (define cdadr
            (lambda (x)
                (cdr (car (cdr x)))))

        (define cddar
            (lambda (x)
                (cdr (cdr (car x)))))

        (define cdddr
            (lambda (x)
                (cdr (cdr (cdr x)))))

        (define caaaar
            (lambda (x)
                (car (car (car (car x))))))

        (define caaadr
            (lambda (x)
                (car (car (car (cdr x))))))

        (define caadar
            (lambda (x)
                (car (car (cdr (car x))))))

        (define caaddr
            (lambda (x)
                (car (car (cdr (cdr x))))))

        (define cadaar
            (lambda (x)
                (car (cdr (car (car x))))))

        (define cadadr
            (lambda (x)
                (car (cdr (car (cdr x))))))

        (define caddar
            (lambda (x)
                (car (cdr (cdr (car x))))))

        (define cadddr
            (lambda (x)
                (car (cdr (cdr (cdr x))))))

        (define cdaaar
            (lambda (x)
                (cdr (car (car (car x))))))

        (define cdaadr
            (lambda (x)
                (cdr (car (car (cdr x))))))

        (define cdadar
            (lambda (x)
                (cdr (car (cdr (car x))))))

        (define cdaddr
            (lambda (x)
                (cdr (car (cdr (cdr x))))))

        (define cddaar
            (lambda (x)
                (cdr (cdr (car (car x))))))

        (define cddadr
            (lambda (x)
                (cdr (cdr (car (cdr x))))))

        (define cdddar
            (lambda (x)
                (cdr (cdr (cdr (car x))))))

        (define cddddr
            (lambda (x)
                (cdr (cdr (cdr (cdr x))))))

        (define list-ref
            (lambda (xs i)
                (internals:precondition
                    (>= i 0)
                    "`i` must be greater than or equals to 0")
                (car (drop xs i))))

        (define first
            (lambda (xs)
                (car xs)))

        (define second
            (lambda (xs)
                (first (cdr xs))))

        (define third
            (lambda (xs)
                (second (cdr xs))))

        (define fourth
            (lambda (xs)
                (third (cdr xs))))

        (define fifth
            (lambda (xs)
                (fourth (cdr xs))))

        (define sixth
            (lambda (xs)
                (fifth (cdr xs))))

        (define seventh
            (lambda (xs)
                (sixth (cdr xs))))

        (define eighth
            (lambda (xs)
                (seventh (cdr xs))))

        (define ninth
            (lambda (xs)
                (eighth (cdr xs))))

        (define tenth
            (lambda (xs)
                (ninth (cdr xs))))

        (define car+cdr
            (lambda (xs)
                (values (car xs) (cdr xs))))

        (define take
            (lambda (xs n)
                (internals:precondition
                    (>= n 0)
                    "`n` must be greater than or equals to 0")
                (cond
                    ((= n 0)
                        '())
                    (else
                        (cons
                            (car xs)
                            (take (cdr xs) (- n 1)))))))

        (define drop
            (lambda (xs n)
                (internals:precondition
                    (>= n 0)
                    "`n` must be greater than or equals to 0")
                (cond
                    ((= n 0)
                        xs)
                    (else
                        (drop (cdr xs) (- n 1))))))

        (define take-right
            (lambda (xs n)
                (internals:precondition
                    (>= n 0)
                    "`n` must be greater than or equals to 0")
                (reverse (take (reverse xs) n))))

        (define drop-right
            (lambda (xs n)
                (internals:precondition
                    (>= n 0)
                    "`n` must be greater than or equals to 0")
                (reverse (drop (reverse xs) n))))

        (define take!
            (lambda (xs n)
                (internals:precondition
                    (>= n 0)
                    "`n` must be greater than or equals to 0")
                (cond
                    ((= n 0)
                        (set! xs '()))
                    (else
                        (set-cdr!
                            (drop xs (- n 1))
                            '())))
                xs))

        (define split-at
            (lambda (xs i)
                (internals:precondition
                    (>= i 0)
                    "`i` must be greater than or equals to 0")
                (values
                    (take xs i)
                    (drop xs i))))

        (define last
            (lambda (xs)
                (internals:precondition
                    (not (null? xs))
                    "`xs` must not be empty")
                (cond
                    ((null? (cdr xs))
                        (car xs))
                    (else
                        (last (cdr xs))))))

        (define last-pair
            (lambda (xs)
                (internals:precondition
                    (not (null? xs))
                    "`xs` must not be empty")
                (cond
                    ((null? (cdr xs))
                        xs)
                    (else
                        (last-pair (cdr xs))))))

        (define length
            (lambda (xs)
                (define length
                    (lambda (count xs)
                        (cond
                            ((null? xs)
                                count)
                            (else
                                (length (+ count 1) (cdr xs))))))
                (length 0 xs)))

        (define append
            (lambda lists
                (cond
                    ((null? lists)
                        '())
                    ((null? (car lists))
                        (apply append
                            (cdr lists)))
                    (else
                        (cons
                            (caar lists)
                            (apply append
                                (cons
                                    (cdar lists)
                                    (cdr lists))))))))

        (define concatenate
            (lambda (lists)
                (apply append lists)))

        (define reverse
            (lambda (xs)
                (define reverse
                    (lambda (reversed xs)
                        (cond
                            ((null? xs)
                                reversed)
                            (else
                                (reverse
                                    (cons (car xs) reversed)
                                    (cdr xs))))))
                (reverse '() xs)))

        (define append-reverse
            (lambda (xs ys)
                (append
                    (reverse xs)
                    ys)))

        (define filter
            (lambda (predicate xs)
                (define filter
                    (lambda (filtered-values predicate xs)
                        (cond
                            ((null? xs)
                                (reverse filtered-values))
                            ((predicate (car xs))
                                (filter
                                    (cons (car xs) filtered-values)
                                    predicate
                                    (cdr xs)))
                            (else
                                (filter
                                    filtered-values
                                    predicate
                                    (cdr xs))))))
                (filter '() predicate xs)))

        (define partition
            (lambda (predicate xs)
                (define partition
                    (lambda (matched-values unmatched-values predicate xs)
                        (cond
                            ((null? xs)
                                (values
                                    (reverse matched-values)
                                    (reverse unmatched-values)))
                            ((predicate (car xs))
                                (partition
                                    (cons (car xs) matched-values)
                                    unmatched-values
                                    predicate
                                    (cdr xs)))
                            (else
                                (partition
                                    matched-values
                                    (cons (car xs) unmatched-values)
                                    predicate
                                    (cdr xs))))))
                (partition '() '() predicate xs)))

        (define remove
            (lambda (predicate xs)
                (define remove
                    (lambda (removed-values predicate xs)
                        (cond
                            ((null? xs)
                                (reverse removed-values))
                            ((predicate (car xs))
                                (remove
                                    removed-values
                                    predicate
                                    (cdr xs)))
                            (else
                                (remove
                                    (cons (car xs) removed-values)
                                    predicate
                                    (cdr xs))))))
                (remove '() predicate xs)))

        (define filter!
            (lambda (predicate xs)
                (define filter!
                    (lambda (predicate xs)
                        (cond
                            ((null? (cdr xs))
                                xs)
                            ((predicate (cadr xs))
                                (filter! predicate (cdr xs)))
                            (else
                                (set-cdr! xs (cddr xs))
                                (filter! predicate xs)))))
                (let ((sentinel-with-xs (cons 'sentinel xs)))
                    (filter! predicate sentinel-with-xs)
                    (cdr sentinel-with-xs))))

        (define any
            (lambda (predicate first-arguments . rest-arguments-list)
                (define any
                    (lambda (predicate arguments-list)
                        (cond
                            ((null? (car arguments-list))
                                #f)
                            ((apply predicate (map car arguments-list))
                                #t)
                            (else
                                (any predicate (map cdr arguments-list))))))
                (any
                    predicate
                    (cons first-arguments rest-arguments-list))))

        (define every
            (lambda (predicate first-arguments . rest-arguments-list)
                (define every
                    (lambda (predicate arguments-list)
                        (cond
                            ((null? (car arguments-list))
                                #t)
                            ((apply predicate (map car arguments-list))
                                (every predicate (map cdr arguments-list)))
                            (else
                                #f))))
                (every
                    predicate
                    (cons first-arguments rest-arguments-list))))

        'OK))

