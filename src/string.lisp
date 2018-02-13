;;;; string process tricks

(defun nchars (&optional (n 40) (c #\Space))
  "returns 'n' copies of 'c'"
  (with-output-to-string (s)
    (dotimes (i n)
      (format s "~a" c))))

(defun dot (&optional (c "."))
  "prints one chacracter, no new line, forced to output"
  (princ c)
  (finish-output))

