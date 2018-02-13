; Load a file if it has not been loaded before.
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

; Set a flag in *features* so we can check in base.lisp
; was loaded before.
(pushnew :zero  *features*)
