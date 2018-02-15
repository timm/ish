;;;; Example of using test.lisp
;;;; Includes one example of a failed test
;;;; so we can test our tests recognize bad tests.

(unless (fboundp 'ish) (load 'ish)) 
(establish
  "test")

(deftest _aa ()
  "should be one failure"
  (test 1 1)
  (test 2 1))

(tests)            


