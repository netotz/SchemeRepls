;; 1.8
; Newtons cubic root

; get n^2
(define (square n)
    (* n n))

; boolean procedure,
; evaluates if the guessed root is accurate enough
(define (isCloseEnough? root radicand)
    (<  (abs (- (newGuess root radicand) root))
        0.00001))

; calculates a new guessed root
(define (newGuess root radicand)
    (/  (+ (/ radicand (square root)) (* 2 root)) 
        3))

; recursive procedure,
; if guessed root is not accurate, it calls itself
(define (iterCbrt root radicand)
    (if (isCloseEnough? root radicand)
        root
        (iterCbrt (newGuess root radicand) radicand)))

; calls 'iterCbrt' with 1.0 as default guess
(define (cbrt radicand)
    (iterCbrt 1.0 radicand))