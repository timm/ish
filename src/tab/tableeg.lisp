(unless (fboundp 'establish) (load "../ish/ish.lisp"))

(establish
  "test"
  "table"
  "time"
  "weathersome"
  "pima_diabetes"
) 

(deftest _table () "small" (weathersome))
(deftest _table2 () "large" (print (timeit #'pima_diabetes)))

(tests)

