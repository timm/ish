(unless (fboundp 'establish) (load 'ish))
(establish
  "test"
  "macro")

(deftest _aif ()
  "anaphoric if"
  (aif (- 10 5)
    (test 5 it)))

(deftest _doitems ()
  "seeking association list"
  (let* ((out)
         (lst '(a b c d)))
    (test '((3 . D) (2 . C) (1 . B) (0 . A))
          (doitems (one n lst out)
            (push (cons n one) out)))))

(deftest _doh ()
  "walking a hash table"
  (let ((n 0)
        (h (make-hash-table)))
    (setf 
      (gethash 'a h) 10
      (gethash 'b h) 20
      (gethash 'c h) 30)
    (test 60
          (doh (k v h n)
            (print `(k ,k v ,v))
            (incf n v))))
)

(deftest _while()
  "whiling away the hours"
  (let ((n 10)
        (m 0))
    (while (> (decf n) 0)
      (incf m n))
    (test 45 m)))

(deftest _until()
  "whiling away the hours"
  (let ((n 10)
        (m 0))
    (until (zerop (decf n))
      (incf m n))
    (test 45 m)))

(deftest _o ()
  "doing a print demo"
  (let ((l 5)
        (m 10)
        (n 20))
    (o l m n)))

(tests)
