;; 1.6
#| It will enter in an infinite loop, because the 'cond' procedure
follows the applicative-order, it evaluates the parameters first,
so it will evaluate 'sqrt-iter' forever.
In contrast, 'if' is an special form which evaluates the parameters
as needed. |#

;; 1.7
; For small numbers, the function starts to lose accuracy
; when radicand <= 10^-4, e.g.
(sqrt 0.0006)

; For large numbers the functions is still accurate, but 
; becomes jammed in very large numbers like this:
(sqrt 82345678912)

; When changed the 'isCloseEnough?' (see 'NewtonsSqrt.scm' for ref)
; to check if the next guess is almost the same as the actual guess
; the calculations for small radicands now are accurate.