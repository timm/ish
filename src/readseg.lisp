(unless (fboundp 'ish) (load 'ish))
(ish
  "test"
  "reads")

(deftest _reads()
  "Reading doco strings"
  (dolist (f (directory "./*.lisp"))
    (reads f #'fundoc)))

(tests)
