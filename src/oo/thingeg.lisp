(unless (fboundp 'establish) (load "../ish/ish.lisp"))
(establish 
  "test"
  "thing")

(defthing stuff thing (a 1) (b 2) (_secret "tim"))

(defthing our stuff (d 10) (_hush 30))

(deftest _thing()
  "things"
  (let ((it (make-instance 'our :b 23)))
    (setf (? it d) 200)
    (decf (? it d))
    (test 199 (? it d))
    (test 30 (? it _hush))))

(tests)
