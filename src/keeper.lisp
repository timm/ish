(unless (fboundp 'establish) (load 'ish)) (garnish "
;;;;
;;;; ## [keeper.LISP](keeper.lisp)
;;;;
;;;; `keeper` is a thing with a unique `id
;;;; that holds a cache `_cache` of kept stuff
;;;; ")
(establish 
  "thing")

(defthing keeper thing (id 0) (_cache))

(let ((n 0))
  (defmethod initialize-instance :after ((i stuff) &rest _) 
    (with-slots (id) i
     (setf id (incf n)))))

(defmethodu  ((k keepr) key )
  #'(lambda (&rest args)
      (with-slots (_cache) k
    (unless _cache
      setf _cache (make-hash-table)))
    (multiple-value-bind (val found-p)
      (gethash key _cache)
      (if found-p val
        (setf (gethash key _cache)
              (apply fn args)))))

(defun keeping (x fn-name)
  (setf (symbol-function fn-name)
        (
(defmacro defkeeer (fn args &body body)
  (let ((fun  (caar args)))
  `(keeping ',fun (defmethod ,fn ,args . ,body))))

(print  (make-instance 'stuff :id 20))
(print  (make-instance 'stuff :id 20))
(print  (make-instance 'stuff :id 20))
(print  (make-instance 'stuff :id 20))

(defmethod aaa ((xx b) a b c) 
  (_kept xx 'aaa 
         #'(lambda (x y z)
             body)
         `(,a ,b ,c)))
