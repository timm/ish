(unless (fboundp 'establish) (load 'lib)) (garnish "
;;;;
;;;; ## Hash.lisp
;;;;
;;;; Hash function utilities.
;;;; ")

(defun hash-keys (h)
  "Return the keys of a hash table."
  (loop for key being the hash-keys of h
        collect key))
