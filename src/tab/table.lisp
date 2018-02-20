(unless (fboundp 'establish) (load "ish.lisp")) (garnish "
;;;;
;;;; ## [TABLE.LISP](table.lisp)
;;;;
;;;; Tables have many columns.
;;;; ")
(establish 
  "thing"
  "keeper"
  "col")

(garnish "
;;;
;;; ## Table
;;; ")

(defun prefix (x y) (eql (char (symbol-name x) 0) y))

(defun skip?    (x) (prefix x #\?))
(defun more?    (x) (prefix x #\>))
(defun less?    (x) (prefix x #\<))
(defun klass?   (x) (prefix x #\!))
(defun num?     (x) (prefix x #\$))
(defun goal?    (x) (or (klass? x) (less? x) (more? x)))
(defun numeric? (x) (or (num? x)   (less? x) (more? x)))
(defun sym?     (x) (and (not (num? x)) (not (goal? x))))

(defthing table keeper (name) (cols) (egs))

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

(defthing row keeper (table) (cells))

(defmethod cell ((r row) col)
  (aref (? r cells) (? col pos)))

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

(defun data (&key name cols egs
             &aux (tab 
                    (make-instance 'table :name name)))
  "Build table for name, col, egs"
  (labels 
   ((okCol (txt)
      (not (skip? txt)))
    (okRow (tab row) 
       (assert (eql (length row)
                    (length (? tab cols)))
               (row) "wrong length ~a" row)
       t)
    (col+ (txt pos tab)
       (funcall
         (make-instance (if (numeric? txt) 'num 'sym))
         :name  txt 
         :pos   pos 
         :table tab))
    (row+ (tab cells)
       (let ((row (make-instance 'row
                     :table tab :cells (l->a cells))))
         (push row (? tab egs))
         (dolist (col (? tab cols))
           (add col (cell row col)))))
    )
   ;; now we can begin
   (doitems (txt pos cols)
     (if (okCol txt)
         (push (col+ txt pos tab) (? tab cols ))))
   (dolist (eg egs)
     (if (okRow tab eg) (row+ tab eg)))
   tab))
