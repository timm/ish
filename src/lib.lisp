(unless (fboundp 'establish) (load 'ish)) (garnish "
;;;;
;;;; ## LIB.LISP
;;;;         
;;;; Load file for all the standard lisp tricks.
;;;; ")

(establish 
  "macro" 
  "hash" 
  "list" 
  "rand" 
  "string"
  "sys"
  "fun"  
)
