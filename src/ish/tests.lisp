(unless (fboundp 'establish) (load "../ish/ish.lisp")) (garnish "
;;;;
;;;; ## [TESTS.LISP](tests.lisp)
;;;;    
;;;; Runs all the unit tests.
;;;; Loads all tests before executing them
;;;; so the final count of 'pass' and 'fail'
;;;; are summed over all unit test files.
;;;; ")

; for the moment, disable running tests when we load files
(pushnew :dont-test *features*)

; load files
(dolist (pat '("../*/*eg.lisp" ))
  (dolist (f (directory pat))
    (establish (pathname-name f))))

; run all tests 
(tests t)
