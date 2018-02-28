(unless (fboundp 'establish) (load "../ish/ish.lisp")) (garnish "
;;;;
;;;; ## [DEFSYSTEM.LISP](defsystem.lisp)
;;;;
;;;; Generates a defsystem file from the public methods
;;;; and in this directory.
;;;;
;;;; Example usage:
;;;;
;;;; ````
;;;; clisp defsystem > package.lisp
;;;; ````
;;;; ")


(defun print-defsystem (&optional (what "ish"))
  "Generates a defsystem file"
  (multiple-value-bind (funs files)
    (public-files-methods)
    (format t "(defsystem \"~a\" 
      :depends-on \"~a\"
      :pathname \"src/\"
      :components (~%" what what)
    (dolist (file files)
      (let ((name (pathname-name file)))
        (unless (member name '("asd" "defsystem") 
                        :test #'equalp)
          (format t "      (:file \"~a\")~%"  name))))
    (format t "))")))

(print-defsystem)
