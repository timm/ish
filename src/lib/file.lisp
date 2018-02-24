(unless (fboundp 'establish) (load "ish.lisp")) (garnish "
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



