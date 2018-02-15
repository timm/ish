(unless (fboundp 'establish) (load 'ish)) (garnish "
;;;;
;;;; ## STRING.LISP
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

(defun string-lines (str &aux pos)
  "Convert a string to a list of lines."
  (labels 
    ((nl    (z) (char= z #\Newline))
     (where (x) (position-if #'nl str :start x))
     (worker (pos0)
        (if (setf pos (where pos0))
            (cons (subseq str pos0 pos) 
                  (worker (1+ pos)))
            (list (subseq str pos0)))))
    (worker 0)))

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


