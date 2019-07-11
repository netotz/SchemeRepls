;; 1.12
;; Pascal's Triangle

; calculates each element of a Pascal row according to:
; element n(x) = element (n-1)(x-1) + element (n-1)(x)
; where x is position of the element, n is Pascal row and total elements
(define (element n x)
    (if (or (= x 1) (= x n))
                1
                (+ (element (- n 1) (- x 1)) (element (- n 1) x))))

; makes a vector of the nth Pascal row
(define (pascal n)
    (let ((row (make-vector n 0)))
        (let next ((i 0))
            (if (= i n)
                row
                (begin (vector-set! row i (element n (+ i 1)))
                (next (+ i 1)))))))