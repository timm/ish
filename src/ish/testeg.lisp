;;;; Example of using test.lisp
;;;; Includes one example of a failed test
;;;; so we can test our tests recognize bad tests.

(unless (fboundp 'establish) (load "ish.lisp")) 
(establish
  "test")

(deftest _aa ()
  "should be one failure"
  (test 1 1)
  (test 2 1))

(tests)            


