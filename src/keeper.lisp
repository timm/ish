(unless (fboundp 'establish) (load 'ish)) (garnish "
;;;;
;;;; ## [keeper.LISP](keeper.lisp)
;;;;
;;;; `keeper` is a thing with a unique `id
;;;; that holds a cache `_cache` of kept stuff
;;;; ")
(establish 
  "thing")

(defthing keeper thing (id (gensym "kept")) (_cache))

(defmacro kept (it &body body)
  (let ((val     (gensym))
        (found-p (gensym))
        (key     (gensym)))
    `(with-slots (_cache) ,it
       (setf _cache (or _cache
                        (make-hash-table)))
       (multiple-value-bind (,val ,found-p)
         (gethash ',key _cache)
         (if ,found-p ,val
           (setf (gethash ',key _cache)
                 (progn ,@body)))))))
