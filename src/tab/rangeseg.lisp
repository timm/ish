(unless (fboundp 'establish) (load "../ish/ish.lisp"))

(establish
  "test"
  "rand"
  "ranges"
  "pima_diabetes"
)

(defstruct emp name age showsize)

(deftest _ranges () 
  (reset-seed 1)
  (let ((lst (loop for _ upto 20000 
                   collect (make-emp :age (* 0.01 
                              (round (expt (randf) 2) 0.01))))))
    (dolist (one (ranges lst :cohen 0.2 :x #'emp-age))
      (format t "~a "   (length one)))
 )
)
(deftest _data()
  (let ((tbl (pima_diabetes)))
    (dolist (col (num! tbl))
      (print col))))

(tests)

