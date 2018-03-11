(unless (fboundp 'establish) (load "../ish/ish.lisp"))

(establish
  "test"
  "rand"
  "ranges"
)

(deftest _ranges () 
  (reset-seed 1)
  (let ((lst (loop for _ upto 200 
                   collect (list 'a (* 0.01 
                              (round (expt (randf) 2) 0.01))))))
    (print lst)
    (dolist (one (ranges lst :cohen 0.2 :f #'second))
      (format t "~a ~a~%"  (length one) one)))
)

(tests)

