;;;; Hash function utilities.

(defun hash-keys (h)
  "return the keys of a hash table"
  (loop for key being the hash-keys of h
        collect key))
