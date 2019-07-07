;; 1.10

; Ackermann's function
(define (Ack m n)
    (cond   ((= n 0) 0)
            ((= m 0) (* 2 n))
            ((= n 1) 2)
            (else (Ack (- m 1) (Ack m (- n 1))))))

(Ack 1 10)  ; => 1024
(Ack 2 4)   ; => 65536
(Ack 3 3)   ; => 65536

(define (f x) (Ack 0 x)) ; = 2x
(define (g x) (Ack 1 x) ; = 2**x
    ; Ack = 2n if m = 0, and Ack = 2 when n = 1
    ; x has a decrement of 1 each call
    ; so the final return is 2 raised to x 
    ; e.g.
    (g 3)
    (Ack 0 (Ack 1 2))
    (Ack 0 (Ack 0 (Ack 1 1)))
    (Ack 0 (Ack 0 2))
    (Ack 0 4)
    8

(define (h x) (Ack 2 x)) ; = (tetration x 2)
(define (k x) (* 5 x x)) ; = 5x**2