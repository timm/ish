(unless (fboundp 'ish) (load 'ish))
(ish
  "test")

(deftest _aa ()
  "should be one failure"
  (test 1 1)
  (test 2 1))

(tests)            


