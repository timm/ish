(unless (fboundp 'establish) (load "ish")) (garnish "
;;;;
;;;; ## [COL.LISP](col.lisp)
;;;;
;;;; Maintain information about a column of
;;;; numbers or symbols
;;;; ")
(establish
  "keeper")

(defun prefix (x y) (eql (char (symbol-name x) 0) y))

(defun skip     (x) (prefix x #\?))
(defun more     (x) (prefix x #\>))
(defun less     (x) (prefix x #\<))
(defun klass    (x) (prefix x #\!))
(defun num      (x) (prefix x #\$))
(defun goal     (x) (or (klass x) (less x) (more x)))
(defun numeric  (x) (or (num x)   (less x) (more x)))
(defun sym      (x) (and (not (num x)) (not (goal x))))

(garnish "
;;;
;;; Columns are places where you add items
;;;   
;;; Columns have a `name`, and fall into some
;;; `pos` inside a `table`.
;;; ")

(defthing col keeper  
  (n 0) (name) (pos) (table))

(defmethod add ((c col) x)
  "Add numbers to column."
	(unless (eql c #\?) ; skip ignores
		(incf (? c n)) ; inc the total counts
		(valid c x) ; check the item is valid
		(add1 c x)) ; add it in
	x)

(defmethod adds ((c col) lst)
  (dolist (x lst) 
    (add c x)))

(garnish "
;;;
;;; Some columns hold `num`bers.
;;; ")

(defthing num col
  (mu 0) (m2 0) (sd 0)
	(lo most-positive-fixnum)
	(hi most-negative-fixnum)
	(all))

(defmethod valid ((n num) x)
  "Numbers have to be numbers."
	(assert (numberp x) (x) "Not a number ~a" x))  

(defmethod add1 ((nu num) x) 
  "New numbers update `min` and `max`."
  (with-slots (n all lo hi mu m2 sd) nu
    (let ((delta (- x mu)))
      (setf lo (min lo x)
            hi (max hi x)
            mu (+ mu (/ delta n))
            m2 (+ m2 (* delta (- x mu)))
            sd (if (< n 2)
                 sd
                 (sqrt (/ m2 (- n 1)))))
      (push x all))))

(defmethod norm ((n num) x)  
  "Convert x to the range 0..1."
	(with-slots (lo hi) n
		(/ (- x lo)
			 (+ (- hi lo)
					(/ 1 most-positive-fixnum)))))

(garnish "
;;;
;;; Some columns hold `sym`bols.
;;;
;;; `Counts` how many symbols are in this
;;; column; `mode` is the most common symbol.
;;; ")

(defthing sym col
	(most 0) (mode) 
	(counts (make-hash-table)))

(defmethod valid ((s sym) x)
  "Anything is valid in a `sym` column."
	(declare (ignore s x)))

(defmethod add1 ((s sym) x)
  "Increment the symbols counts,
  update `mode` when necessary."
	(with-slots (most mode counts  n) s
		(incf n)
		(let* 
        ((new (incf (gethash x counts 0))))
        (if (> new most)
          (setf most new
                mode x)))))

(defmethod norm ((s sym) x) 
  "Normalize symbols does nothing."
  x)

(defmethod keys ((s sym))
	(keep s
    (hash-keys (? s counts))))
