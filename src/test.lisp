(defvar *tests* nil)

(defmacro deftest (name params  &optional (doc "") &body body)
  "Create a defun, adding it name to the list of *tests*."
  (pushnew name *tests*)
  `(defun ,name ,params ,doc
     (format t "~&~%;;; ~a~%; ~a~%" ',name ,doc)
     ,@body))

(let ((pass 0) (fail 0.000001))
  (defun test (want got)
    (cond ((equalp want got) (incf pass))
          (t (incf fail)
             (format t "~&; fail : expected ~a~%" want))))

  (defun tests (&optional force)
    (when *tests*
      (when (or force (not (member :dont-test *features*)))
        (mapc #'funcall  (reverse *tests*))
        (format t "~&~%; pass : ~a = ~5,1f% ~%; fail : ~a = ~5,1f% ~%"
                pass (* 100 (/ pass (+ pass fail)))
                fail (* 100 (/ fail (+ pass fail)))))))
)
