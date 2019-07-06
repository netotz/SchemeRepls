;; 1.6
#| It will enter in an infinite loop, because the 'cond' procedure
follows the applicative-order, it evaluates the parameters first,
so it will evaluate 'sqrt-iter' forever.
In contrast, 'if' is an special form which evaluates the parameters
as needed. |#

;; 1.7