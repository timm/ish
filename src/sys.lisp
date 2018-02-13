; here i'm attempting to localize all the stuff
; that is implementation dependent


(defun klass-slots (it)
  #+clisp
  (class-slots (class-of it))
  #+sbcl
  (sb-mop:class-slots (class-of it)))

(defun klass-slot-definition-name (x)
  #+clisp
  (slot-definition-name x)
  #+sbcl
  (sb-mop:slot-definition-name x))

(defun args ()
  #+clisp ext:*args*
  #+sbcl sb-ext:*posix-argv*
  #+allegro (sys:command-line-arguments))

(defun done ()
  #+sbcl (sb-ext:exit)
  #+:clisp (ext:exit)
  #+allegro (excl:exit))
