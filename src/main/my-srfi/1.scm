;;
;; List Library
;;

(define-library (my-srfi 1)

    (import
        (scheme base))

    (export
        first
        second)

    (begin

        (define first
            (lambda (xs)
                (car xs)))

        (define second
            (lambda (xs)
                (first (cdr xs))))

        'OK))

