(unless (fboundp 'establish) (load "../ish/ish.lisp"))

(establish
  "test"
  "table"
  "weathersome")

(deftest _table () 
  (weathersome)
)

(tests)

