; procedures to print to console

(define (println expr)
    (display expr)
    (newline))

(define (printlist lst)
    (map write lst))
