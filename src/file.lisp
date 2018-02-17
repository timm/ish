(unless (fboundp 'establish) (load 'ish)) (garnish "
;;;;
;;;; ## [FILE.LISP](file.lisp)
;;;;
;;;; File handling.
;;;; ")

(defun reads (f &optional  (fn #'print) (str t))
  "Read  a file, calling 'fn' on each s-expression. "
  (with-open-file (s f)
    (labels 
      ((worker (&optional (one (read s nil :eof)))
              (unless (eq  one :eof)
                (funcall fn  one str)
                (worker))))
      (worker))))


(defun public-files-methods ()
  "Returns two values: the public functions and files."
  (labels 
    ((lt     (x y) (string< (pathname-name x) (pathname-name y)))
     (eg     (x) (ends-with-p (pathname-name x) "eg"))
     (defp   (x) (member (first x) '(defun defmacro defmethod)))
     (secret (x) (char= #\_ (elt (symbol-name (second x)) 0)))
     (docp   (x) (and (> (length x) 3)
                      (stringp (fourth x))
                      (not (equal "" (fourth x)))))
     (public (x) (and (defp x) (docp x) (not (secret x)))))
    (let* (funs
            (files (directory "*.lisp"))
            (less  (remove-if #'eg files)))
      (dolist (f less)
        (reads f #'(lambda (x _)
                     (if (public x)
                       (push (second x) funs)))))
      (values funs (sort less #'lt)))))


