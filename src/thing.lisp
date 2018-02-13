; Simpler than standard CLOS
; Everything is a "thing" with a built in
; print method

#-base (load "base")
(uses "sys")

(defun defslot  (slot x form)
  `(,slot
    :initarg  ,(intern (symbol-name slot) "KEYWORD")
    :initform ,form
    :accessor ,(intern (format nil "~a-~a" x slot))))

(defclass thing () ())

(defmacro defthing (x parent &rest slots)
  `(defclass ,x (,parent)
     ,(loop for (slot form) in slots collect (defslot slot x form))))

(defmethod public-slot-names ((it thing))
    (remove-if 
      #'(lambda (x)
          (and (symbolp x) 
               (equal (elt (symbol-name x) 0) #\_)))
      (mapcar 
        #'klass-slot-definition-name
        (klass-slots it))))

(defmethod print-object ((it thing) out)
   (let ((lst (mapcar 
                #'(lambda (s)
                    (list s (slot-value it s)))
                (sort (public-slot-names it)
                      #'string<))))
    (format out "~a" (cons (class-name (class-of it)) lst))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; simpler accessor (works for nested slots as well)

(defmacro ? (obj first-slot &rest more-slots)
  "From https://goo.gl/dqnmvH:"
  (if (null more-slots)
      `(slot-value ,obj ',first-slot)
      `(? (slot-value ,obj ',first-slot) ,@more-slots)))
