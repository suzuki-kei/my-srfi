;;
;; List Library
;;

(define-library (my-srfi 1)

    (import
        (scheme base))

    (export
        first
        second
        third
        fourth
        fifth)

    (begin

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

        'OK))

