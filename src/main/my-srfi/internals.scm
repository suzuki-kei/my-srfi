;;
;; Internal procedures.
;;

(define-library (my-srfi internals)

    (import
        (scheme base))

    (export
        precondition)

    (begin

        (define precondition
            (lambda (condition description)
                (cond
                    (condition
                        #t)
                    (else
                        (error description)))))

        'OK))

