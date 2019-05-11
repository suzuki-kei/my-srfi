;;
;; List Library
;;

(define-library (my-srfi 1)

    (import
        (scheme base)
        (my-srfi internals))

    (export
        list
        xcons
        cons*
        make-list
        list-tabulate
        list-copy
        reverse
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
        take
        drop
        take-right)

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
            (lambda (n . arguments)
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
                (define x
                    (if
                        (null? arguments)
                        #f
                        (car arguments)))
                (precondition
                    (>= n 0)
                    "`n` must be greater than or equals to 0")
                (make-list '() n x)))

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
                (precondition
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

        (define reverse
            (lambda (xs)
                (define reverse
                    (lambda (xs reversed)
                        (cond
                            ((null? xs)
                                reversed)
                            (else
                                (reverse
                                    (cdr xs)
                                    (cons (car xs) reversed))))))
                (reverse xs '())))

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

        (define take
            (lambda (xs n)
                (precondition
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
                (precondition
                    (>= n 0)
                    "`n` must be greater than or equals to 0")
                (cond
                    ((= n 0)
                        xs)
                    (else
                        (drop (cdr xs) (- n 1))))))

        (define take-right
            (lambda (xs n)
                (precondition
                    (>= n 0)
                    "`n` must be greater than or equals to 0")
                (reverse (take (reverse xs) n))))

        'OK))

