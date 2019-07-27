;; 1.19
;; algorithm for computing the Fibonacci numbers in a logarithmic number of steps

; Tpq transforms the pair (a,b) according to:
;; a ← bq + aq + ap
;; b ← bp + aq
; show that Tp'q' = Tpq(Tpq(a,b)):

;; if Tpq(a,b) = (bq + aq + ap, bp + aq),
;; then Tpq(Tpq(a,b)) = Tpq(bq + aq + ap, bp + aq) =
;; ((bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p, (bp + aq)p + (bq + aq + ap)q) = 
;; (b(2pq + q*q) + a(p*p + q*q) + a(2pq + q*q), b(p*p + q*q) + a(2pq + q*q)),
;;; so p' = p*p + q*q
;;; q' = 2pq + q*q

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0)
         b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))
                   (+ (* 2 p q) (* q q))
                   (/ count 2)))
        (else
         (fib-iter (+ (* b q)
                      (* a q)
                      (* a p))
                   (+ (* b p)
                      (* a q))
                   p
                   q
                   (- count 1)))))