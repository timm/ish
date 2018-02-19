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

(defun prefix (x y) (eql (char (symbol-name x) 0) y))

(defun skip     (x) (prefix x #\?))
(defun more     (x) (prefix x #\>))
(defun less     (x) (prefix x #\<))
(defun klass    (x) (prefix x #\!))
(defun num      (x) (prefix x #\$))
(defun goal     (x) (or (klass x) (less x) (more x)))
(defun numeric  (x) (or (num x)   (less x) (more x)))
(defun sym      (x) (and (not (num x)) (not (goal x))))

(defthing  table keeper  
  (name) (cols) (egs))

(defun someCols (tab fn)
  (select #'(lambda (x) (funcall fn (slot-value x 'name)))
          (? tab cols)))

(defone table-more  (tab) (someCols tab #'more))
(defone table-less  (tab) (someCols tab #'less))
(defone table-klass (tab) (someCols tab #'klass))
(defone table-num   (tab) (someCols tab #'num)) 
(defone table-sym   (tab) (someCols tab #'sym))

(defun table-klassCol (tab)
  (car (table-klass tab)))

(garnish "
;;; 
;;; How to read tables in from data.
;;; ")

(defun data (&key name cols egs
             &aux (tab (make-table :name name)))
  "Build table for name, col, egs"
  (labels 
   ((okCol (txt)
           (not (skip txt)))
    (okRow (tab row) 
           (assert (eql (length row)
                        (length (table-cols tab)))
                   (row) "wrong length ~a" row)
           t)
    (col+ (txt pos tab)
          (funcall
           (if (numeric txt) #'make-num #'make-sym)
           :name  txt 
           :pos   pos 
           :table tab))
    (row+ (tab cells)
          (let ((row (make-row :table tab
                               :cells (l->a cells))))
               (push row (table-egs tab))
               (dolist (col (table-cols tab))
                 (add col (row-cell row col)))))
    )
   ;; now we can begin
   (doitems (txt pos cols)
     (if (okCol txt)
         (push (col+ txt pos tab)
               (table-cols tab))))
   (dolist (eg egs)
     (if (okRow tab eg)
         (row+ tab eg)))
   tab))


