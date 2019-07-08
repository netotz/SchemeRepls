; defines a vector that stores the currencies
(define denominations 
    (vector 1 5 10 25 50 ;4
            ; bills below
            100 200 500 1000 2000 5000 10000))

(define (countChange amount currency)
    (cond ((or (= amount 0) (= currency 0)) 1)
            ; (= currency 0) only works if the vector is sorted ascending,
            ; meaning the smallest currency must be vector's 0 index
          ((< amount 0) 0)
          (else (+ (countChange amount (- currency 1))
                   (countChange (- amount (vector-ref denominations currency))
                                currency)))))