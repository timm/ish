(unless (fboundp 'establish) (load "../ish/ish.lisp")) (garnish "
;;;;
;;;; ## [TABLE.LISP](table.lisp)
;;;;
;;;; Tables have many columns.
;;;; ")
(establish 
  "thing"
  "keeper"
  "list"
  "col")

(garnish "
;;;
;;; ## Table
;;; ")

(defthing table keeper (name) (cols) (rows))
(defthing row keeper (_table) (cells))

(defun prefix (x y) (eql (char (symbol-name x) 0) y))

(defun skip?    (x) (prefix x #\?))
(defun more?    (x) (prefix x #\>))
(defun less?    (x) (prefix x #\<))
(defun klass?   (x) (prefix x #\!))
(defun num?     (x) (prefix x #\$))
(defun goal?    (x) (or (klass? x) (less? x) (more? x)))
(defun numeric? (x) (or (num? x)   (less? x) (more? x)))
(defun sym?     (x) (and (not (num? x)) (not (goal? x))))

(defun someCols (tab fn)
  (select #'(lambda (x) (funcall fn (?  x name)))
          (? tab cols)))

(defmethod more!  ((tab  table)) (keep tab (someCols tab #'more?)))
(defmethod less!  ((tab  table)) (keep tab (someCols tab #'less?)))
(defmethod klass! ((tab  table)) (keep tab (someCols tab #'klass?)))
(defmethod num!   ((tab  table)) (keep tab (someCols tab #'num?)))
(defmethod sym!   ((tab  table)) (keep tab (someCols tab #'syns?)))

(defmethod klassCol ((tab table)) (car (klass? tab)))

(garnish "
;;;
;;; ## Row
;;; ")

(defmethod cell ((r row) col)
  (aref (? r cells) (? col pos)))

(defmethod okRow? ((r row) lst) 
  (assert (eql (length lst) (length (? r _table cols)))
          (lst) "wrong length ~a" lst)
  t)

(defmethod row+ ((r row) lst)
  (when (okRow? r lst)
    (push r (? r _table rows))
    (dolist (col (? r _table cols) r)
      (add col (cell r col)))))

(defmethod  klassValue! ((r row))
  (keep r
    (aref
      (? r cells)
      (? (klassCol (? r table)) 
         pos))))

(defmethod klassRange! ((r row))
  (keep r
    (range
      (klassCol (? r table))
      (klassValue r))))

(garnish "
;;; 
;;; ## Data
;;;
;;; How to read tables in from data.
;;; ")


(defmethod okCol? ((tab table) txt)
  "If no skip character, col is ok to add."
  (not (skip? txt)))

(defmethod col+ ((tab table) txt pos)
  "Create one column"
  (make-instance 
    (if (numeric? txt) 'num 'sym )
    :name   txt 
    :pos    pos 
    :_table tab))

(defmethod cols+ ((tab table) lst)
  "Add a list of cols to the table."
  (doitems (txt pos lst tab)
    (if (okCol? tab txt)
      (push (col+ tab txt pos) 
            (? tab cols)))))

(defmethod row+ ((tab table) lst)
  "Add a row to the table."
  (row+ 
      (make-instance 'row
           :_table tab :cells (l->a lst))
      lst))

(defun data (&key name cols egs)
  "Make a table from name, column names, examples."
  (let ((tab (make-instance 'table :name name)))
    (cols+ tab cols)
    (dolist (eg egs tab)
      (row+ tab eg))))
