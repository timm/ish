(unless (fboundp 'establish) (load "../ish/ish.lisp")) (garnish "
;;;;
;;;; ## [KEEPER.LISP](keeper.lisp)
;;;;
;;;; `keeper` is a thing with a unique `id`
;;;; that holds a cache `_cache` of kept stuff.
;;;; For an example of usage, see [keepereg.lisp](keepereg.lisp).
;;;;
;;;; ")
(establish 
  "thing")

(defthing keeper thing (id (gensym "kept")) (_cache))

(defmacro keep (it &body body)
  "using the hash table _cache, compute this once, then keep it"
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
