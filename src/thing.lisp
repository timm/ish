;;;; My simplications to CLOS
;;;; Everything is a "thing" with a built-in print method

(unless (fboundp 'ish) (load 'ish))
(ish "sys")

;;; simple nested accessor for CLOS instances or structs

(defmacro ? (obj first-slot &rest more-slots)
  "From https://goo.gl/dqnmvH:"
  (if (null more-slots)
      `(slot-value ,obj ',first-slot)
      `(? (slot-value ,obj ',first-slot) ,@more-slots)))

;;; defthing (simpler that defclass)

(defun defslot  (slot x form)
  "helper function for defthing"
  `(,slot
    :initarg  ,(intern (symbol-name slot) "KEYWORD")
    :initform ,form
    :accessor ,(intern (format nil "~a-~a" x slot))))

(defclass thing () ())

(defmacro defthing (x parent &rest slots)
  "simpler creator for claseses. see example in thingeg.lisp"
  `(defclass ,x (,parent)
     ,(loop for (slot form) in slots collect (defslot slot x form))))

;;; standard methods for all things

(defmethod public-slot-names ((it thing))
  "return all thing slots that don't start with '_'"
    (remove-if 
      #'(lambda (x)
          (and (symbolp x) 
               (equal (elt (symbol-name x) 0) #\_)))
      (mapcar 
        #'klass-slot-definition-name
        (klass-slots it))))

(defmethod print-object ((it thing) out)
  "print string for all public slot names"
   (let ((lst (mapcar 
                #'(lambda (s)
                    (list s (slot-value it s)))
                (sort (public-slot-names it)
                      #'string<))))
    (format out "~a" (cons (class-name (class-of it)) lst))))

