(unless (fboundp 'establish) (load "../ish/ish.lisp"))

(establish
  "test"
  "rand"
  "ranges"
  "pima_diabetes"
)

(defstruct emp name age showsize)

(deftest _ranges () 
  "some"
  (reset-seed 1)
  (let ((lst (loop for _ upto 20000 
                   collect (make-emp :age (* 0.01 
                              (round (expt (randf) 2) 0.01))))))
    (dolist (one (ranges lst :cohen 0.2 :x #'emp-age))
      (format t "~a "   (length one)))
 )
)
(deftest _data()
  "daa"
  (let ((tbl (pima_diabetes)))
    (dolist (col (num! tbl))
      (labels ((x (row) (cell row col)))
        (multiple-value-bind (bins epsilon)
          (ranges (? tbl rows) :x #'x )
          (format t "~%~a ~5,2f~%" (? col name) epsilon)
          (dolist (bin  bins)
            (format t "    ~a [~a : ~a]~%" 
                    (length bin)
                    (x (head bin))
                    (x (tail bin)))))))))

(tests)

