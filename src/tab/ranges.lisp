(unless (fboundp 'establish) (load "../ish/ish.lisp")) (garnish "
;;;;
;;;; ## [COL.LISP](col.lisp)
;;;;
;;;; Maintain information about a column of
;;;; numbers or symbols
;;;; ")
(establish
  "table"
)

(garnish "
;;;
;;; Columns are places where you add items
;;;
;;; Columns have a `name`, and fall into some
;;; `pos` inside a `table`
;;; ")

(defun ranges (lst &key (n 20) epsilon  (cohen 0.2) (f #'identity))
 (setf epsilon (or epsilon
                    (* cohen (? (nums lst :filter f) sd)))
       n       (if (>= (mod (length lst) n) 0)
                   (1+ n)
                   n))
 (labels ((x     (z)   (funcall f z)) 
          (order (a b) (< (x a) (x b)))
          (same  (top current next)
                 (or (< (- (x current) (x top)) (x epsilon))
                     (eql (x current) (x next))))
          (main  (m lst &aux tmp) 
                 (print 10000)
                 (let ((top (car lst)))
                   (while 
                     (and lst (>= (decf m) 0))
                     (push (pop lst) tmp))
                   (while
                     (and lst (same top (car tmp) (car lst)))
                     (push (pop lst) tmp))
                   (if (< (length lst) n)  
                     (list (copy-list tmp))
                     (cons tmp (main n lst))))))
   (mapcar 
     #'reverse 
     (main n (sort lst #'order)))))
