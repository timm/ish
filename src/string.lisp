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

(defun starts-with-p (str1 str2)
  "Determine whether `str1` starts with `str2`"
  (let ((p (search str2 str1)))
    (and p (= 0 p))))
 
(defun ends-with-p (str1 str2)
  "Determine whether `str1` ends with `str2`"
  (let ((p (mismatch str2 str1 :from-end T)))
    (or (not p) (= 0 p))))
 
(defun containsp (str1 str2)
  "Determine whether `str1` contains `str2`.
   Instead of just returning T, return a list of starting locations
   for every occurence of `str2` in `str1`"
   (unless (string-equal str2 "")
     (loop for p = (search str2 str1) then (search str2 str1 :start2 (1+ p))
           while p 
           collect p)))


