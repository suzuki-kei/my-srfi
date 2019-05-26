;;
;; Internal procedures.
;;

(define-library (my-srfi internals)

    (import
        (scheme base))

    (export
        precondition
        nth
        nth-or-default
        classify-list)

    (begin

        (define precondition
            (lambda (condition description)
                (cond
                    (condition
                        #t)
                    (else
                        (error description)))))

        (define nth
            (lambda (xs n)
                (precondition
                    (>= n 0)
                    "`n` must be greater than or equals to 0")
                (cond
                    ((= n 0)
                        (car xs))
                    (else
                        (nth (cdr xs) (- n 1))))))

        (define nth-or-default
            (lambda (xs n default)
                (precondition
                    (>= n 0)
                    "`n` must be greater than or equals to 0")
                (cond
                    ((null? xs)
                        default)
                    ((= n 0)
                        (car xs))
                    (else
                        (nth-or-default
                            (cdr xs)
                            (- n 1)
                            default)))))

        (define classify-list
            (lambda (xs)
                (define classify
                    (lambda (xs ys)
                        (cond
                            ((eqv? xs ys)
                                'circular-list)
                            ((null? ys)
                                'proper-list)
                            ((not (pair? ys))
                                'dotted-list)
                            ((null? (cdr ys))
                                'proper-list)
                            ((not (pair? (cdr ys)))
                                'dotted-list)
                            (else
                                (classify (cdr xs) (cddr ys))))))
                (cond
                    ((null? xs)
                        'proper-list)
                    ((not (pair? xs))
                        'dotted-list)
                    (else
                        (classify xs (cdr xs))))))

        'OK))

