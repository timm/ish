#-base (load "base")
(uses 
  "test"
  "macro")

(deftest doitems! ()
  "seeking association list"
  (let* ((out)
         (lst '(a b c d)))
    (test '((3 . D) (2 . C) (1 . B) (0 . A))
          (doitems (one n lst out)
            (push (cons n one) out)))))

#-tests (tests)
