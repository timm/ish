(unless (fboundp 'establish) (load "../ish/ish.lisp")) (garnish "
;;;;
;;;; ## [FUN.LISP](fun.lisp)
;;;;
;;;; Functional programming tricks (e.g. memoing).  
;;;;

;;;
;;; ### General
;;; ")

(defun noop (&rest lst) 
  "the greatest meta function of all"
  lst)

(garnish "
;;;
;;; ### Memoing
;;; ")

(defun memo (fn &key (key #'first) (test #'eql) name)
  "Low-level memoing workhorse."
  (let ((table (make-hash-table :test test)))
    (setf (get name 'memo) table)
    #'(lambda (&rest args)
        (let ((k (funcall key args)))
          (multiple-value-bind (val found-p)
            (gethash k table)
            (if found-p val
              (setf (gethash k table) (apply fn args))))))))

(defun memoize (fn-name
                 &key (key #'(lambda (args) (first args)))
                      (test #'eq))
  "Replace fn-name's global definition with a memoized version."
  (clear-memoize fn-name)
  (setf (symbol-function fn-name)
        (memo (symbol-function fn-name)
              :name fn-name :key key :test test)))

(defun clear-memoize (fn-name)
  "Clear the hash table from a memo function."
  (let ((table (get fn-name 'memo)))
    (when table (clrhash table))))

(defmacro defmemo (fn args &body body)
  "Standard memoing functions: indexes on first arg."
  `(memoize (defun ,fn ,args . ,body)))

(defmacro defone (fn args &body body)
  "Memoing function for structs/instances with an id slot."
  `(memoize (defun ,fn ,args . ,body)
            :key (lambda (args) 
                   (slot-value (car args) 'id))))
