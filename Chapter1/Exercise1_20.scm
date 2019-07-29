;; 1.20

(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))

;; How many remainder operations are actually performed in the normal-order evaluation of (gcd 206 40)?
(gcd 206 40)
(= 40 0) ; #f
    (gcd 40 (remainder 206 40))
    (= (remainder 206 40) 0) ; +1
    (= 6 0) ; #f
        (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
        (= (remainder 40 (remainder 206 40)) 0) ; +1
        (= (remainder 40 6) 0) ; +1
        (= 4 0) ; #f
            (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
            (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0) ; +2
            (= (remainder 6 (remainder 40 6)) 0) ; +1
            (= (remainder 6 4) 0) ; +1
            (= 2 0) ; #f
                (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
                (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0) ; +3
                (= (remainder (remainder 40 6) (remainder 6 (remainder 40 6))) 0) ; +2
                (= (remainder 4 (remainder 6 4)) 0) ; +1
                (= (remainder 4 2) 0) ; +1
                (= 0 0) ; #t
                    (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) ; +2
                    (remainder 6 (remainder 40 6)) ; +1
                    (remainder 6 4) ; +1
                    2
;; 'remainder' called 18 times

;; In the applicative-order evaluation?
(gcd 206 40)
(= 40 0) ; #f
    (gcd 40 (remainder 206 40))
    (gcd 40 6)
    (= 6 0) ; #f
        (gcd 6 (remainder 40 6))
        (gcd 6 4)
        (= 4 0) ; #f
            (gcd 4 (remainder 6 4))
            (gcd 4 2)
            (= 2 0) ; #f
                (gcd 2 (remainder 4 2))
                (gcd 2 0)
                (= 0 0) ; #t
                    2
; 'remainder' called 4 times