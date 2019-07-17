;; 1.16
;; Successive squaring iterative process
(define (square x)
    (* x x))

(define (succSq product counter)
    (if (= counter 1)
        product
        (succSq (square product) (/ counter 2))))