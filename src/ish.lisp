(defun garnish (str &key toc))

(garnish "
;;;;
;;;; ## [ISH.LISP](ish.lisp)
;;;; 
;;;; Main control file for ISH. Builds
;;;; a list of all known LISP files in
;;;; the current directory tree. Then,
;;;; when we request to establish a file,
;;;; then we can find it within the local dirs.
;;;; ")

(let (files ; all files in this directory tree 
       seen ; all files already loaded
       (pats; where to find files
          '("./*.lisp" "./*/*.lisp" "./*/*/*.lisp"))
       )
  (labels ((known (x) (cdr (assoc x files :test #'equalp))))
    ; ---------------------------------------------
    (dolist (pat pats)
      (dolist (file (directory pat))
        (let ((name (pathname-name file)))
          (if  (known name)
            (format t "; W> ignoring repeated file ~a~%" file)
            (push (cons name file) files)))))
    ; ---------------------------------------------
    (defun establish (&rest lst)
      "Load a file if it has not been loaded before."
      (dolist (f lst)
        (when (not (member f seen :test #'equalp))
          (if (not  (known f))
            (format t "; E>  avoiding missing file ~a~%" f) 
            (let ((p (known f)))
              (format t "; ~a~%" f)
              (push f seen)  
              #-sbcl
              (load p) 
              #+sbcl
              (handler-bind
                ((style-warning #'muffle-warning))
                (load p)))))))))


