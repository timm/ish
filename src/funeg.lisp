(unless (fboundp 'establish) (load 'ish)) (garnish "
;;;;
;;;; Examples of use for fun.lisp
;;;; ")

(establish 
  "test"
  "fun")

(defmemo _fib (n)
  (if (< n 2)
    n
    (+ (_fib (- n 1 )) (_fib (- n 2)))))

(deftest _fibbing ()
  "wont teremiante if not memoing"
  (test (_fib 0) 0)
  (test (_fib 15) 610)
  (test (_fib 40) 102334155) 
  (_fib 1000)
  )

(tests)            
