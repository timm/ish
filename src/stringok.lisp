#-base (load "base")
(uses 
  "test"
  "string")

(deftest chars! ()
  "seeking 3 characters"
  (test (nchars 3 #\;) ";;;"))

(tests)
