;;;; examples of how to use string.lisp

(unless (fboundp 'ish) (load 'ish))
(ish
  "test"
  "string")

(deftest _nchars ()
  "repeated chars"
  (test "aaa" (nchars 3 #\a)))

(deftest _lines ()
  (test 4 (length
            (string-lines "asas
              vvvv
              ccc 
"))))

(tests)            
