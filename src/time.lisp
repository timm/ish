(unless (fboundp 'establish) (load 'ish)) (garnish "
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
