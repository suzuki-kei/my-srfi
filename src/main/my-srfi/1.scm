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
        fifth
        sixth
        seventh
        eighth
        ninth)

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

        'OK))

