(unless (fboundp 'establish) (load "../ish/ish.lisp")) (garnish "
;;;;
;;;; ## [TIME.LISP](TIME.lisp)
;;;;
;;;; Functions for handking time.
;;;; ")

(defun current-date-string ()
  "Returns current date as a string."
  (multiple-value-bind (sec min hr day mon yr dow dst-p tz)
    (get-decoded-time)
    (declare (ignore sec min hr dow dst-p tz))
    (format nil "~A-~A-~A" yr mon day)))

(defun current-year ()
  "Returns current year."
  (multiple-value-bind 
    (sec min hr day mon yr dow dst-p tz)
    (get-decoded-time)
    (declare (ignore sec min hr day mon  dow dst-p tz))
    yr))

(defun timeit (f &optional (n 20))
  (let (t2 (t1 (get-internal-run-time)))
    (dotimes (i n) 
      (funcall f))
   (setf t2 (get-internal-run-time))
   (float (/  (- t2 t1) (* n internal-time-units-per-second)))))
