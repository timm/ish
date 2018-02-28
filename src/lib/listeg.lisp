(unless (fboundp 'establish) (load "../ish/ish.lisp"))

(establish
  "test"
  "list")

(deftest _items() 
  (let ((lst '(a b c d e f)))
    (test 'a (_1 lst))
    (test 'b (_2 lst))
    (test 'c (_3 lst))
    (test 'd (_4 lst))
    (test 'e (_5 lst))
    (test 'a (head lst))
    (test 'f (tail lst))
))

(deftest _select ()
  "seeking association list"
  (test '(1 3 5 7)
        (select #'oddp
                '(0 1 2 3 4 5 6 7 8 ))))

; example of nested list pretty print, columns lined up
(printm '((forecast temp humidity wind play)
          (sunny  85  85  false  no)
          (sunny  72  95  false  no)
          (sunny  80  90  true   no)
          (rainy  65  70  true   no)
          (rainy  71  91  true   no)
          (overcast  83  86  false  yes)
          (rainy  70  96  false  yes)
          (rainy  68  80  false  yes)
          (overcast  64  65  true  yes)
          (sunny  69  70  false  yes)
          (rainy  75  80  false  yes)
          (sunny  75  70  true  yes)
          (overcast  72  90  true  yes)
          (overcast  81  75  false  yes)))

(tests)

