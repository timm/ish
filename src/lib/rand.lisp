(unless (fboundp 'establish) (load "../ish/ish.lisp")) (garnish "
;;;;
;;;; ## [RAND.LISP](rand.lisp)
;;;;    
;;;; A platform independent random number generator.
;;;; Not as good as LISP's built in random number generator
;;;; but I could never figure our how to store or share the seed
;;;; of that generator. Hence this code.
;;;; ")

(let* ((seed0      10013)
       (seed       seed0)
       (multiplier 16807.0d0)
       (modulus    2147483647.0d0))
  (defun reset-seed (&optional (n seed0))  (setf seed n))
  (defun randf      (&optional (n 1)) (* n (- 1.0d0 (park-miller-randomizer))))
  (defun randi      (&optional (n 1)) (floor (* n (/ (randf 1000.0) 1000))))
  (defun park-miller-randomizer ()
    "cycle= 2,147,483,646 numbers"
    (setf seed (mod (* multiplier seed) modulus))
    (/ seed modulus))
)
