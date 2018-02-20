(unless (fboundp 'establish) (load "ish.lisp"))

(establish
  "test"
  "table"
  "weathersome")

(deftest _table () 
  (weathersome)
)

(tests)

