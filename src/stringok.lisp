(unless (fboundp 'ish) (load 'ish))
(ish
  "test"
  "string")

(deftest _nchars ()
  "repeated chars"
  (test "aaa" (nchars 3 #\a)))

(tests)            
