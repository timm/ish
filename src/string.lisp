(unless (fboundp 'establish) (load 'ish)) (garnish "
;;;;
;;;; ## string.lisp
;;;; ")

(defun nchars (&optional (n 40) (c #\Space))
  "returns 'n' copies of 'c'"
  (with-output-to-string (s)
    (dotimes (i n)
      (format s "~a" c))))

(defun dot (&optional (c "."))
  "prints one chacracter, no new line, forced to output"
  (princ c)
  (finish-output))

(defun string-lines (str)
  "divide a string into lines"
  (let* ((nl  #'(lambda (z) (char= z #\Newline)))
         (pos (position-if nl str)))
    (if pos
      (cons (subseq str 0 pos)
            (string-lines (subseq str (1+ pos)))) 
      (list str))))

