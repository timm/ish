;;;; load file for all the standard lisp tricks

(unless (fboundp 'ish) (load 'ish))
(ish 
  "macro" 
  "hash" 
  "list" 
  "rand" 
  "string"
  "sys"
  "fun"  
)
