; get n^2
(define (square n)
    (* n n))

(define (sqrt radicand)
    ;; 'radicand' as free var: it is not necessary to pass it as arg to every procedure
    ;; local procedures below

    ; true if guessed root is almost the exact root
    (define (isCloseEnough? root)
        (< (abs (- (newGuess root radicand) root))
            0.000001))

    ; recalculates the guessed root
    (define (newGuess root)
        (/ (+ root (/ radicand root) )
            2))

    ; decides whether to continue guessing the root or to stop
    (define (iterSqrt root)
        (if (isCloseEnough? root)
            root
            (iterSqrt (newGuess root))))
    
    ; calls the recursive function with 1 as default guess
    (iterSqrt 1.0))