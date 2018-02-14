(unless (fboundp 'establish) (load 'ish))
(establish
  "string")

(garnish "## reads.lisp

Tools for extracting documentation from LISP code.
Reads files, one s-expression at a time. Any `defuns`
are seleced and their function name arg list and
doc strings are printed")

(defun fundoc (x s)
  "takes the function documentation string and
  prints it, indented by a little white space"
  (labels ((defp     () (member (first x) '(defun defmacro)))
           (garnishp () (eql    (first x)  'garnish))
           (docp     () (and    (> (length x) 3)
                                (stringp (fourth x))
                                (not (equal "" (fourth x)))))
           (dump (str  &optional (pad ""))
             (dolist (line (string-lines str))
                (format s "~a~a~%" pad (string-trim " " line)))))
    (when (garnishp)
      (terpri s)
      (dump (second x))
      (terpri s))
    (when (and (defp) (docp))
      (format s "~%`~(~a~) ~(~a~)`~%~%-" (second x) (or (third x) ""))
      ((dump (fourth x) "   "))))

(defun reads (f &optional  (fn #'print) (str t))
  "Read  a file, calling 'fn' on each s-expression. "
  (with-open-file (s f)
    (labels 
      ((worker (&optional (one (read s nil :eof)))
              (unless (eq  one :eof)
                (funcall fn  one str)
                (worker))))
      (worker))))
