;; 1.17
;; integer multiplication by means of repeated addition

; book's method
(define (multiplyBook a b)
    (if (= b 0)
        0
        (+ a (multiplyBook a (- b 1)))))

(define (multiplyIter a b n)
    (if (= n 1)
        b
        (multiplyIter a (+ b a) (- n 1))))