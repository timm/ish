(defun hash-keys (h)
    (loop for key being the hash-keys of h
          collect key))
