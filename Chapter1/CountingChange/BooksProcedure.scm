; procedure to compute the number of ways to change any given amount of money
(define (countChange amount coins)
    (cond ((= amount 0) 1)
          ((or (< amount 0) (= coins 0)) 0)
          (else (+ (countChange amount (- coins 1))
                   (countChange (- amount (firstValue coins))
                                coins)))))
(define (firstValue coins)
    (cond ((= coins 1) 1)
          ((= coins 2) 5)
          ((= coins 3) 10)
          ((= coins 4) 25)
          ((= coins 5) 50)))

; how the reduction rule applies to the problem
; of making change for 10 cents using pennies and nickels.
; cc as countChange
(cc 10 2)
(+ (cc 10 1) (cc 5 2)) ; easy to see that is 3:
;   ways to change 10 cents with pennies plus
;   ways to change 5 cents with nickels and pennies
(+ (+ (cc 10 0) (cc 4 1)) (+ (cc 5 1) (cc 0 2)))
(+ (+ 0 (cc 4 1)) (+ (cc 5 1) 1))
(+ (+ 0 (+ (cc 4 0) (cc 3 1))) (+ (+ (cc 5 0) (cc 4 1)) 1))
(+ (+ 0 (+ 0 (cc 3 1))) (+ (+ 0 (cc 4 1)) 1))
(+ (+ 0 (+ 0 (+ (cc 3 0) (cc 2 1)))) (+ (+ 0 (+ (cc 4 0) (cc 3 1))) 1))
(+ (+ 0 (+ 0 (+ 0 (cc 2 1)))) (+ (+ 0 (+ 0 (cc 3 1))) 1))
(+ (+ 0 (+ 0 (+ 0 (+ (cc 2 0) (cc 1 1))))) (+ (+ 0 (+ 0 (+ (cc 3 0) (cc 2 1)))) 1))
(+ (+ 0 (+ 0 (+ 0 (+ 0 (cc 1 1))))) (+ (+ 0 (+ 0 (+ 0 (cc 2 1)))) 1))
(+ (+ 0 (+ 0 (+ 0 (+ 0 (+ (cc 1 0) (cc 0 1)))))) (+ (+ 0 (+ 0 (+ 0 (+ (cc 2 0) (cc 1 1))))) 1))
(+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 1))))) (+ (+ 0 (+ 0 (+ 0 (+ 0 (cc 1 1))))) 1))
(+ 1 (+ (+ 0 (+ 0 (+ 0 (+ 0 (cc 1 1))))) 1))
(+ 1 (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ (cc 1 0) (cc 0 1)))))) 1))
(+ 1 (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 1))))) 1))
(+ 1 (+ 1 1))
3
; there are 3 possible ways to change 10 cents:
;   2 nickels
;   1 nickel + 5 pennies
;   10 pennies