(unless (fboundp 'establish) (load "../ish/ish.lisp"))

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

(defmethod! age1 ((e emp))
  (incf (? e calls))
  (- (current-year) (? e dob)))

(defmethod! age2 ((e emp))
  "Here is some stuff."
  (incf (? e calls))
  (- (current-year) (? e dob)))

(deftest _keep ()
  "_keeping. age is called many times but computed only once."
    (let ((e (make-instance 'emp)))
      (dotimes (i 10) (age e))
      (print (age e))
      (test 1 (? e calls)))
    (let ((e (make-instance 'emp)))
      (dotimes (i 10) (age1 e))
      (print (age1 e))
      (test 1 (? e calls)))
    (let ((e (make-instance 'emp)))
      (dotimes (i 10) (age2 e))
      (print (age2 e))
      (test 1 (? e calls)))
)
(tests)
