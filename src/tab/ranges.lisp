(unless (fboundp 'establish) (load "../ish/ish.lisp")) (garnish "
;;;;
;;;; ## [RANGES.LISP](ranges.lisp)
;;;;
;;;; Sort and divide numeric data.
;;;;
;;;; ")
(establish
  "table"
)

(defun ranges (lst &key (n 20) epsilon  (cohen 0.2) (x #'identity))
  "Given a `lst` of structures, and a selector x
   that returns a value from a structure, sort the
   lst and divide into chuncks of at least size `n`
   whose `lo` and `hi` item or each range is at 
   least differeny by some value `epsilon`. If
   `epsilon` not supplied, compute it form `cohen`
   times the standard deviation of the distribution."
  (let* (
     (small   (* cohen (? (nums lst :filter x) sd)))
     (epsilon (or epsilon small)) 
     (n       (if (zerop (mod (length lst) n)) n (1+ n))))
    (labels (
       (v     (z)   (funcall x z)) 
       (order (a b) (< (v a) (v b)))
       (same  (top current next)
              (or 
                (eql (v current) (v next))
                (< (- (v current) (v top))  epsilon)
                ))
       (main  (m lst &aux tmp) 
              (let ((top (car lst)))
                (while 
                  (and lst (>= (decf m) 0))
                  (push (pop lst) tmp))
                (while
                  (and lst (same top (car tmp) (car lst)))
                  (push (pop lst) tmp))
                (if (< (length lst) n)  
                  (list (copy-list lst))
                  (cons (reverse tmp) (main n lst))))))
      (values
        (main n (sort lst #'order))
        epsilon))))
