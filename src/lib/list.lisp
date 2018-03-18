(unless (fboundp 'establish) (load "../ish/ish.lisp")) (garnish "
;;;;
;;;; ## [LIST.LISP](list.lisp)
;;;;         
;;;; Tricks for handling lisp lists.
;;;; ")

(defun head (lst) "Return first item" (car lst))
(defun tail (lst) "Return last item" (car (last lst)))

(defun l->a (lst)
  "coerce list to array"
  (make-array (length lst) :initial-contents lst))

(defun a->l (a &key (lo 0) (hi (length a)))
  "coerce array to list"
  (coerce (subseq a lo hi) 'list))

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
