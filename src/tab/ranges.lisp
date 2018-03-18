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

(defun xranges (lst &key (n 20) epsilon  (cohen 0.2) (f #'identity))
  "Given a `lst` of structures, and a selector x
  that returns a value from a structure, sort the
  lst and divide into chuncks of at least size `n`
  whose `lo` and `hi` item or each range is at 
  least differeny by some value `epsilon`. If
  `epsilon` not supplied, compute it form `cohen`
  times the standard deviation of the distribution."
  (multiple-value-bind (n epsilon) 
    (range0 lst n epsilon cohen f)
    (labels (
             (v     (z)   (funcall f z)) 
             (order (a b) (< (v a) (v b)))
             (same  (top current next)
                    (or (eql (v current) (v next))
                        (< (- (v current) (v top)) epsilon)))
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

(defun range-sum (arr &key (f #'identity) (lo 0) (hi (length arr)))
  (let ((out (make-instance 'num)))
     (loop for i from lo to (1- hi) do
        (adds out (aref arr i) :filter f))
    out))

(defun range0 (lst n epsilon cohen f)
  (let ((all   (nums lst :filter f))
        (growp (> (mod (length lst) n) 0)))
    (format t ">>~a ~%" (* cohen (? all sd)))
    (values 
      (if growp   (1+ n) n)
      (or epsilon (* cohen (? all sd))))))

(defun xyranges (lst &key (xn 20)      (yn xn) 
                          xepsilon     (yepsilon xepsilon)           
                          (xcohen 0.2) (ycohen xcohen) 
                          (xf #'first) (yf #'second))
  (multiple-value-bind (yn yepsilon) 
    (range0 lst yn yepsilon ycohen yf)
    (let (out
          (arr (l->a (xranges lst :n xn :epsilon xepsilon 
                                  :cohen xcohen :f xf))))
      (format t "[~a] ~%" (length arr))
      (labels 
        ((all (lo hi)
              (range-sum arr :lo lo :hi hi :f yf))
         (argmin (lo hi &aux cut (best   most-positive-fixnum))
                 (when (< lo hi)
                   (let ((b4 (all lo hi)))
                     (loop for j from (1+ lo) to hi do
                           (let* ((l   (all lo j))
                                  (r   (all j hi))
                                  (now (+ (xpect l 'sd (? b4 n))
                                          (xpect r 'sd (? b4 n)))))
                             (if (and (< now best)
                                      (< (- (? l mu) (? r mu))
                                         yepsilon))
                               (setf best now
                                     cut  j))))))
                 cut)
         (recurse (lo cut hi)
                  (split lo  cut)
                  (split cut hi))
         (split (lo hi)
                (let ((cut (argmin lo hi)))
                  (if cut
                    (recurse lo cut hi)
                    (push (a->l arr :lo lo :hi hi) out)))))
        (split 0 (length arr))
        (reverse out)))))
