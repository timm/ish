(unless (fboundp 'establish) (load "ish"))

(establish
  "test"
  "col")

(deftest _num() 
  "Compute number."
  (let ((n (make-instance 'num)))
    (adds n '(9 2 5 4 12 7 8 11 9 3
              7 4 12 5 4 10 9 6 9 4))
    (test 3.0607877 (? n sd))
    (test 7         (? n mu))))

(let ((n (make-instance 'num)))
  (dotimes (i 1000000)
    (add n i)))

(tests)
