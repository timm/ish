(unless (fboundp 'establish) (load "../ish/ish.lisp")) (garnish "
;;;;
;;;; ## [LIB.LISP](lib.lisp)
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
