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
