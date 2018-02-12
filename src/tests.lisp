#-base (load "base")

; for the moment, disable running tests when we load files
(pushnew :dont-test *features*)

; load files
(dolist (f (directory "./*ok.lisp")) 
  (uses (pathname-name f)))

; run all tests 
(tests t)
