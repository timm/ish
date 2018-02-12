(pushnew :base *features*)

(let ((seen))
  (defun uses (&rest lst)
    (dolist (f lst)
      (when (not (member f seen :test #'equalp))
        (format t "; ~a~%" f)
        (push f seen)  
        #-sbcl
        (load f) 
        #+sbcl
        (handler-bind
          ((style-warning #'muffle-warning))
          (load f))))))
