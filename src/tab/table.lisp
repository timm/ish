(unless (fboundp 'establish) (load "../ish/ish.lisp")) (garnish "
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

(defthing table keeper (name) (cols) (egs))

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
    (col+ (txt pos tab what)
          (make-instance what  :name  txt :pos   pos :table tab)
          (print 1000)
          (make-instance what :name  txt :pos   pos :table tab)
          (print 2000)
          (make-instance what :name  txt :pos   pos :table tab)
          )
    (row+ (tab cells)
       (let ((row (make-instance 'row
                     :table tab :cells (l->a cells))))
         (push row (? tab egs))
         (dolist (col (? tab cols))
           (add col (cell row col)))))
    )
   ;; now we can begin
   (doitems (txt pos cols)
     (print 5) (print txt) (print (okCol txt))
     (when (okCol txt)
       (print 10)
        (print (slot-value  tab 'cols))
        (print 3000)
         (let* ((ako  (if (numeric? txt) 'num 'sym ))
               (what (col+ txt pos tab ako)))
           (push what (? tab cols )))))
   (print 70000)
   (dolist (eg egs)
     (if (okRow tab eg) (row+ tab eg)))
   tab))
