(unless (fboundp 'establish) (load "ish.lisp")) (garnish "
;;;;
;;;; ## [ASD.LISP](asd.lisp)
;;;;
;;;; Generates an asf file from the public methods
;;;; and in this directory.
;;;;
;;;; Example usage:
;;;;
;;;; ````
;;;; clisp asd > fft.asd
;;;; ````
;;;; ")


(defun asd (&optional (what "ish"))
  "Generates an asd file"
  (format t "(defpackage :~a 
    (:use :common-lisp)
    (export~%" what)
  (dolist (fun (sort (public-files-methods) #'string<))
     (format t "       :~(~a~)~%" fun))
  (format t "))")
  (format t "~%~%(in-package :~a)~%" what))


(asd)
