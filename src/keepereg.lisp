(unless (fboundp 'establish) (load 'ish))

(establish
  "test"
  "macro"
  "time"
  "keeper")

(defthing emp keeper (dob 1960) (calls 0))

(defmethod age ((e emp))
  (kept e
    (format t "[making age]~%")
    (incf (? e calls) )
    (- (current-year) (? e dob))))

(deftest _keep ()
  "_keeping"
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
    (test 1 (slot-value e 'calls))
    ))

(tests)
