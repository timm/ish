(defun garnish (str &key toc)
  "Output some markdown text." )

(garnish "
;;;;
;;;; ## ish.lisp
;;;; 
;;;; Main control file for ISH.
;;;; ")

(let ((seen)) ;memory of what was laoded before
  (defun establish (&rest lst)
    "Load a file if it has not been loaded before."
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


