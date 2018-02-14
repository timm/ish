(unless (fboundp 'establish) (load 'ish))
(establish
  "test"
  "reads")

(deftest _reads()
  "Reading doco strings"
  (dolist (f (directory "./*.lisp"))
      (reads f #'fundoc)))

(tests)
