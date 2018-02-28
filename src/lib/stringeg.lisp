;;;; examples of how to use string.lisp

(unless (fboundp 'establish) (load "../ish/ish.lisp"))
(establish
  "test"
  "string")

(deftest _nchars ()
  "repeated chars"
  (test "aaa" (nchars 3 #\a)))

(deftest _lines ()
  "Breaking strings into lines."
  (test 4 (length
            (string-lines "asas
              vvvv
              ccc 
"))))

(dolist (x (string-lines "asas
                         vvvv
                         ccc
"))
  (print x))

(deftest _stats-ends-contains ()
  (test t       (starts-with-p "foobar"  "foo"))
  (test nil     (starts-with-p "foobar"  "bar"))
  (test nil     (ends-with-p   "foobar"  "foo"))
  (test t       (ends-with-p   "foobar"  "bar"))
  (equal '(2)   (containsp     "foobar"  "oba"))
  (equal '(1 2) (containsp     "ababaBa" "ba"))
  (equal nil    (containsp     "foobar"  "x")))

(tests)            
