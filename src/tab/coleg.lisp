(unless (fboundp 'establish) (load "ish.lisp"))

(establish
  "test"
  "col")

(deftest _num () 
  "Compute number."
  (let ((nu (nums '(9 2 5 4 12 7 8 11 9 3
                   7 4 12 5 4 10 9 6 9 4))))
    (test 3.0607877 (? nu sd))
    (test 7         (? nu mu))))

(deftest _sym ()
  "Computer symbols"
  (let ((s (syms '(a b b c c c c))))
    (let ((diff (abs (- 1.3787836 (ent s)))))
      (test t (< diff 0.0001)))))

(tests)
