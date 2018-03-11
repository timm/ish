(unless (fboundp 'establish) (load "../ish/ish.lisp"))

(establish
  "test"
  "rand"
  "ranges"
)

(defstruct emp name age showsize)

(deftest _ranges () 
  (reset-seed 1)
  (let ((lst (loop for _ upto 200 
                   collect (make-emp :age (* 0.01 
                              (round (expt (randf) 2) 0.01))))))
    (dolist (one (ranges lst :cohen 0.2 :f #'emp-age))
      (format t "~a ~a~%"  (length one) one))
 )
)

(tests)

