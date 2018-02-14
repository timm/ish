(unless (fboundp 'ish) (load 'ish))
(ish
  "string")

(defun reads.lisp ()
  "Tools for extracting documentation from LISP code.
   Reads files, one s-expression at a time. Any `defuns`
   are seleced and their function name arg list and
   doc strings are printed")

(defun fundoc (x)
  "takes the function documentation string and
  prints it, indented by a little white space"
  (let ((kind (first x))
        (name (second x))
        (args (third x))
        (doc  (fourth x)))
    (when (and (member kind '(defun defmacro))
               (not (char= (elt (symbol-name name) 0) #\_))
               (stringp doc)
               (not (equal "" doc)))
      (format t "~%`~(~a~) ~(~a~)`~%-" name (or args ""))
      (dolist (line (string-lines doc))
        (format t "    ~a~%" (string-trim " " line))))))

(defun reads (f &optional (fn #'print))
  "Read  a file, calling 'fn' on each s-expression. "
  (let ((header (nchars 60 ";")))
    (with-open-file (s f)
      (labels 
        ((read1 (&optional (one (read s nil :eof)))
                (unless (eq  one :eof)
                  (funcall fn one )
                  (read1))))
        (read1)))))



