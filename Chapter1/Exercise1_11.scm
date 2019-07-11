;; 1.11
; recursive process
(define (f n)
    (cond ((< n 3) n)
        (else (+ (f (- n 1))
                 (* 2 (f (- n 2)))
                 (* 3 (f (- n 3)))))))

; iterative process
(define (fIter x y z count)
    (if (= count 0)
        x
        (fIter (+ x (* 2 y) (* 3 z)) x y (- count 1))))
(define (fCall n)
    (if (< n 3)
        n
        ; it starts with f(2) f(1) and f(0) as default args,
        ; so K iterations will result f(K+2),
        ; therefore the counter is set in n-2
        (fIter 2 1 0 (- n 2))))
        
; e.g. for n=5, just 3 iterations are needed
(fCall 5)
(f 5)
; the time difference between both procedures
; grows very fast as n gets larger,
; also the recursive process has a small limit where it gets stuck,
; while the iterative one is only limited by data type