#-zero (load "zero")
(uses 
  "test"
  "string")

(deftest _nchars ()
  "repeated chars"
  (test "aaa" (nchars 3 #\a)))

(tests)            
