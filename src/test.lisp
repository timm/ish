(unless (fboundp 'establish) (load 'ish)) (garnish "
;;;; 
;;;; ## test.lisp
;;;; 
;;;; A tiny unit test engine in LISP.
;;;; This code lets us define and call tests in two ways.
;;;;
;;;; Firstly, we can run one isoalted set of tests.
;;;; E.g. it Xeg.lisp ends in '(tests)', then loading
;;;; that file runs the associated tests for `X.lisp`.
;;;; 
;;;; Secondly, we can load all the tests BEFORE 
;;;; running anything. E.g. the file tests.lisp
;;;; pushes :dont-test onto *features* then loads
;;;; all the *eg.lisp files. The tests are then run
;;;; all together by call `tests` with the optional
;;;; `force` arguement set.
;;;; ")

(defvar *tests* nil)

(defmacro deftest (name params  &optional (doc "") &body body)
  "Create a new test, adding its name to the list of *tests*."
  (pushnew name *tests*)
  `(defun ,name ,params ,doc
     (format t "~&~%;;; ~a~%; ~a~%" ',name ,doc)
     ,@body))

(let ((pass 0) (fail 0))
  (defun test (want got)
    "increment 'pass' if want==got, else increment 'fail'"
    (cond ((equalp want got) (incf pass))
          (t (incf fail)
             (format t "~&; fail : expected ~a~%" want))))

  (defun tests (&optional force)
    "run all the rests, report the result. Disabled
     if :dont-test exists in '*features'. Disabled is
     disabled if `force' is true."
    (when *tests*
      (when (or force (not (member :dont-test *features*)))
        (mapc #'funcall  (reverse *tests*))
        (format t "~&~%; pass : ~a = ~5,1f% ~%; fail : ~a = ~5,1f% ~%"
                pass (* 100 (/ pass (+ 0.0001 pass fail)))
                fail (* 100 (/ fail (+ 0.0001 pass fail)))))))
)
