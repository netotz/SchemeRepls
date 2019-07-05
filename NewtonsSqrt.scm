(define (square n)
    (* n n))

(define (isCloseEnough? root radicand)
    (< (abs (- (square root) radicand)) 0.0001))

(define (newGuess root radicand)
    (/ (+ root (/ radicand root) ) 2))

(define (iterSqrt root radicand)
    (if (isCloseEnough? root radicand)
        root
        (iterSqrt (newGuess root radicand) radicand)))

(define (sqrt num)
    (iterSqrt 1.0 num))

(sqrt 21)