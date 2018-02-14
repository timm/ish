;;;; example of using hash.lisp

(unless (fboundp 'establish) (load 'ish))
(establish 
  "test"
  "hash")

(deftest _keys ()
  "i want hash keys"
  (let ((h (make-hash-table)))
    (setf 
      (gethash 'a h) 'aa
      (gethash 'b h) 'bb
      (gethash 'c h) 'cc)
    (test 
      '(a b c)
      (sort
        (hash-keys h) #'string<))))

(tests)            
