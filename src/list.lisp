(unless (fboundp 'establish) (load "ish")) (garnish "
;;;;
;;;; ## [LIST.LISP](list.lisp)
;;;;         
;;;; Tricks for handling lisp lists.
;;;; ")

(defun _1 (lst) "Return 1st item" (first lst))
(defun _2 (lst) "Return 2nd item" (second lst))
(defun _3 (lst) "Return 3rd item" (third lst))
(defun _4 (lst) "Return 4th item" (fourth lst))
(defun _5 (lst) "Return 5th item" (fifth lst))
(defun head (lst) "Return first item" (car lst))
(defun tail (lst) "Return last item" (car (last lst)))

(defun l->a (lst)
  "coerce list to array"
  (make-array (length lst) :initial-contents lst))

(defun select (selector-fn facts)
  "return all list items satisying selector-fn"
  (remove-if-not selector-fn facts))

(defun printm (lsts &key (out t) (sep ",") (underline "-"))
  "pretty print a list of lists, lining up the columns"
  (let ((sep1 ""))
    (labels
        ((newWidth (old str)
           (max old (length (format nil "~a" str))))
         (wstr (w)
           (let ((str (format nil "~a~~~a<~~a~~>" sep1 (1+ w))))
             (setf sep1 sep)
             str))
         (zeros (lst)
           (make-sequence 'list (length lst) :initial-element 0))
         (show (fmt x)
           (format out fmt x))
         (underlines (widths)
           (dolist (width widths)
             (write-string " " out)
             (loop repeat width do
                  (write-string underline out))
             (write-string sep out))
           (setf underline nil)))
      (let ((widths (zeros (car lsts))))
        (dolist (lst lsts)
          (setf widths (mapcar #'newWidth widths lst)))
        (let ((fmts (mapcar #'wstr widths)))
          (dolist (lst lsts)
            (mapc #'show fmts lst)
            (terpri out)
            (when underline
              (underlines widths)
              (terpri out))))))))
