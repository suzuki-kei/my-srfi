;;
;; List Library
;;

(define-library (my-srfi 1)

    (import
        (scheme base))

    (export
        first)

    (begin

        (define first
            (lambda (xs)
                (car xs)))

        'OK))

