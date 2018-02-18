(unless (fboundp 'establish) (load "ish"))

(establish
  "test"
  "macro"
  "time"
  "keeper")

(defthing emp keeper (dob 1960) (calls 0))

(defmethod age ((e emp))
  (keep e
    (incf (? e calls) )
    (- (current-year) (? e dob))))

(deftest _keep ()
  "_keeping. age is called many times but computed only once."
  (let ((e (make-instance 'emp)))
    (age e)
    (age e)
    (age e)
    (age e)
    (age e)
    (age e)
    (age e)
    (age e)
    (age e)
    (print (age e))
    (test 1 (? e calls))
    ))

(tests)
