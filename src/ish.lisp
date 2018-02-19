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
                (load p))))))))

  (defun public-files-methods ()
    "Returns two values: the public functions and files."
    (labels
      ((ends-with-p (str1 str2)
                    (let ((p (mismatch str2 str1 :from-end T)))
                      (or (not p) (= 0 p))))
       (reads (f &optional  (fn #'print) (str t))
              (with-open-file (s f)
                (labels 
                  ((worker (&optional (one (read s nil :eof)))
                           (unless (eq  one :eof)
                             (funcall fn  one str)
                             (worker))))
                  (worker))))
       (lt     (x y) (string< (pathname-name x) (pathname-name y)))
       (eg     (x) (ends-with-p (pathname-name x) "eg"))
       (defp   (x) (member (first x) '(defun defmacro defmethod)))
       (secret (x) (char= #\_ (elt (symbol-name (second x)) 0)))
       (docp   (x) (and (> (length x) 3)
                        (stringp (fourth x))
                        (not (equal "" (fourth x)))))
       (public (x) (and (defp x) (docp x) (not (secret x)))))
      (let* (funs
              (all   (mapcar #'cdr files))
              (less  (remove-if #'eg all)))
        (dolist (f less)
          (reads f #'(lambda (x _)
                       (if (public x)
                         (push (second x) funs)))))
        (values funs (sort less #'lt)))))
)


