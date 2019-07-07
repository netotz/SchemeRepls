; get n^2
(define (square n)
    (* n n))

; boolean procedure
; true if guessed root is almost the exact root
(define (isCloseEnough? root radicand)
    ; checks difference between root^2 and actual radicand
    ; (< (abs (- (square root) radicand)) 0.00001)

    ; checks if the next guess is almost the same as the actual guess
    (< (abs (- (newGuess root radicand) root))
        0.000001))

; recalculates the guessed root
(define (newGuess root radicand)
    (/ (+ root (/ radicand root) )
        2))

; decides whether to continue guessing the root or to stop
(define (iterSqrt root radicand)
    (if (isCloseEnough? root radicand)
        root
        (iterSqrt (newGuess root radicand) radicand)))

; calls the recursive function with 1 as default guess
(define (sqrt num)
    (iterSqrt 1.0 num))