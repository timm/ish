(defmacro aif (test then &optional else)
  "Anaphoric 'if'"
  `(let ((it ,test))
     (if it ,then ,else)))

(defmacro doitems ((one n list &optional out) &body body )
  "Set 'one' and 'n' to each item in a list, and its position."
  `(let ((,n -1))
     (dolist (,one ,list ,out)
       (incf ,n)
       ,@body)))

(defmacro doh ((k v h &optional out) &body body )
  "Set key 'k' and value 'v' to each item in a list, and its position."
  `(progn
     (maphash #'(lambda (,k ,v)
                  ,@body)
              ,h)
     ,out))

(defmacro while (test &body body)
  `(do ()
       ((not ,test))
     ,@body))

(defmacro until (test &body body)
  `(while (not ,test)
     ,@body))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defmacro oprim (x)
  `(progn (format t "~&[~a]=[~a] " ',x ,x) ,x))

(defmacro o (&rest l)
  "Print a list of symbols and their bindings."
  (let ((last (gensym)))
    `(let (,last)
       ,@(mapcar #'(lambda(x) `(setf ,last (oprim ,x))) l)
       (terpri)
       ,last)))


