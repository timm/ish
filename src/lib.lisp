(unless (fboundp 'establish) (load 'ish))
(garnish "## lib.lisp
         
Load file for all the standard lisp tricks.")

(establish 
  "macro" 
  "hash" 
  "list" 
  "rand" 
  "string"
  "sys"
  "fun"  
)
