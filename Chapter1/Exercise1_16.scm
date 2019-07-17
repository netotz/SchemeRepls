;; 1.16
;; Successive squaring iterative process

(define (evenExp product counter)
    (if (= counter 1)
        product
        (evenExp (* product product) (/ counter 2))))

; using book's hint
(define (oddExp a b n)
    (if (= n 0)
        a
        (oddExp (* a b) b (- n 1))))

(define (fastExpIter state_var base exponent)
    (cond ((= exponent 0)
            state_var)
        ((even? exponent)
            (fastExpIter state_var (* base base) (/ exponent 2)))
        (else
            (fastExpIter (* state_var base) base (- exponent 1)))))

(define (power base exponent)
    (fastExpIter 1 base exponent))