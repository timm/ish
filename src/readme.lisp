(unless (fboundp 'establish) (load 'ish)) (garnish "
;;;;
;;;; ## read,me.lisp
;;;;
;;;; Tools for extracting documentation from LISP code.
;;;; Reads files, one s-expression at a time. Any `defuns`
;;;; are seleced and their function name arg list and
;;;; doc strings are printed.
;;;; ")

(load "file")
(load "string")

(setf +header+ "
[![](https://raw.githubusercontent.com/timm/ish/master/etc/img/banner.png)](https://github.com/timm/ish/blob/master/README.md)[home](http://git.io/ish)
| [code](https://github.com/timm/ish/tree/master/src)
| [discuss](https://github.com/timm/ish/issues)
| [contribute](https://github.com/timm/ish/blob/master/CONTRIB.md)
| [cite](https://github.com/timm/ish/blob/master/CITATION.md)
| [&copy; 2018](https://github.com/timm/ish/blob/master/LICENSE.md)


[![](https://zenodo.org/badge/doi/10.5281/zenodo.1172230.svg)](https://github.com/timm/ish/blob/master/CITATION.md)

______


Please see the
[master readme](https://github.com/timm/ish/blob/master/README.md)

")

(defun fundoc (x s)
  "Takes the function documentation string and
  prints it, indented by a little white space"
  (labels ((defp     () (member (first x) '(defun defmacro)))
           (garnishp () (eql    (first x)  'garnish))
           (docp     () (and    (> (length x) 3)
                                (stringp (fourth x))
                                (not (equal "" (fourth x)))))
           (dump (str  &optional (pad ""))
             (dolist (line (string-lines str))
                (format s "~a~a~%" pad (string-trim " ;" line)))))
    (when (garnishp)
      (terpri s)
      (dump (second x))
      (terpri s))
    (when (and (defp) (docp))
      (format s "~%`~(~a~) ~(~a~)`~%~%-" (second x) (or (third x) ""))
      (dump (fourth x) "   "))))

(defun readme()
  "Reading doco strings."
  (dolist (f (sort (directory "*.lisp") 
                   #'(lambda (x y) (string< (pathname-name x) 
                                            (pathname-name y)))))
    (let ((name (pathname-name f)))
      (unless (search "eg.lisp" name)
        (reads f #'fundoc)))))

(format t "~a"  +header+)
(readme)