;;
;; Internal procedures.
;;

(define-library (my-srfi internals)

    (import
        (scheme base))

    (export
        precondition
        nth-or-default)

    (begin

        (define precondition
            (lambda (condition description)
                (cond
                    (condition
                        #t)
                    (else
                        (error description)))))

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

        'OK))

