(unless (fboundp 'establish) (load "../ish/ish.lisp")) (garnish "
;;;;
;;;; ## [COL.LISP](col.lisp)
;;;;
;;;; Maintain information about a column of
;;;; numbers or symbols
;;;; ")
(establish
  "macro"
  "keeper")

(garnish "
;;;
;;; Columns are places where you add items
;;;   
;;; Columns have a `name`, and fall into some
;;; `pos` inside a `table`.
;;; ")

(defthing col keeper  
  (n 0) (name) (pos) (_table))

(defmethod add ((c col) x &key (filter #'identity))
  "Add numbers to column."
  (unless (eql c #\?) ; skip ignores
    (let ((y (funcall filter x)))
      (incf (? c n)) ; inc the total counts
      (valid c y) ; check the item is valid
      (add1 c y))) ; add it in
  x)

(defmethod adds ((c col) lst &key (filter #'identity))
  (dolist (x lst c) 
    (add c x :filter filter)))

(defun nums (lst &key (filter #'identity)) 
  (adds (make-instance 'num) lst :filter filter))

(defun syms (lst &key (filter #'identity)) 
  (adds (make-instance 'sym) lst :filter filter))

(garnish "
;;;
;;; Some columns hold `num`bers.
;;; ")

(defthing num col
  (mu 0) (m2 0) (sd 0)
  (lo most-positive-fixnum)
  (hi most-negative-fixnum)
  )

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
                 (sqrt (/ m2 (- n 1))))))))

(defmethod norm ((n num) x)  
  "Convert x to the range 0..1."
  (with-slots (lo hi) n
    (/ (- x lo)
       (+ (- hi lo)
          (/ 1 most-positive-fixnum)))))

(defmethod xpect ((nu num) field n)
   (float (* (/ (? nu n) n) 
             (slot-value nu field))))

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

(defmethod ent ((s sym))
  (with-slots (counts n) s
    (let ((e 0))
      (doh (k v counts e)
        (let ((p (/ v n)))
          (decf e (* p (log p 2))))))))

