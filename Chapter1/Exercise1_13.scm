;; 1.13
;; Prove that Fib(n) is the closest integer to (φ^n - ψ^n)/sqrt(5)

(define (fibIter n1 n2 count)
    (if (= count 0)
        n1
        (fibIter n2 (+ n1 n2) (- count 1))))
(define (fibonacci n)
        (fibIter 0 1 n))

(define (prove fib n)
    (define phi (/ (+ 1 (sqrt 5)) 2))
    (define tau (/ (- 1 (sqrt 5)) 2))
    (define golden (/ (- (expt phi n) (expt tau n)) (sqrt 5)))
    (if (= fib (round golden))
        '(equal)
        '(not equal)))