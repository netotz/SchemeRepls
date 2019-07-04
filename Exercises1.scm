;; 1.2
(/
    ( + 5 4 2 (- 3) 6
        (/ 4 5)
    )
    (* 3 
        (- 6 2)
        (- 2 7)
    )
)

;; 1.3
;; take 3 args, return sum of squares of the 2 largest nums
(define (function x y z)
    ; list made from args
    (define lst (list x y z))

    ; use lst members as args to '+'
    (apply + 
        ; use the lambda for each member in lst
        (map
            ; anonymous function that returns x^2
            (lambda (x) (* x x))

            ; remove a member from lst
            (remove 
                ; use lst members as args to 'min'
                (apply min lst) 
            lst))))
(function 5 4 1)

;; 1.4
; the conditional statement (is b greater than 0?) will decide 
; which procedure (+ if true, else -) to be applied to the args (a, b)
(define (a-plus-abs-b a b) 
    ((if (> b 0)
        +
        -) 
    a b))