;; 1.17 , 1.18
;; integer multiplication by means of repeated addition

; book's method
(define (multiplyBook a b)
    (if (= b 0)
        0
        (+ a (multiplyBook a (- b 1)))))

; iterative process
; used for 1.18
(define (multiplyIter a b n)
    (if (= n 1)
        b
        (multiplyIter a (+ b a) (- n 1))))

; included methods
(define (double int)
    (+ int int))
(define (halve int)
    (/ int 2))

; multiplication procedure analogous to fast-expt
;; also answer for exercise 1.18
(define (fastMultIter a b n)
    (cond ((= n 1)
            b)
        ((even? n)
            (fastMultIter a (double b) (halve n)))
        (else
            (fastMultIter a (+ b a) (- n 1)))))
(define (multiply a b)
    (fastMultIter a a b))