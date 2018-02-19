(unless (fboundp 'establish) (load "ish.lisp")) (garnish "
;;;;
;;;; ## [README.LISP](readme.lisp)
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
| [doc](https://github.com/timm/ish/blob/master/src/README.md)
| [discuss](https://github.com/timm/ish/issues)
| [contribute](https://github.com/timm/ish/blob/master/CONTRIB.md)
| [cite](https://github.com/timm/ish/blob/master/CITATION.md)
| [&copy; 2018](https://github.com/timm/ish/blob/master/LICENSE.md)


[![](https://zenodo.org/badge/doi/10.5281/zenodo.1172230.svg)](https://github.com/timm/ish/blob/master/CITATION.md)

______

# Some Useful(ish) Documentation

This page is auto-generated using:

      clisp readme > README.md

For high-level notes on this work, please see the
[master readme](https://github.com/timm/ish/blob/master/README.md).

")

(defun fundoc (x s)
  "Takes the function documentation string and
  prints it, indented by a little white space"
  (labels ((defp     () (member (first x) '(defun defmacro defmethod)))
           (garnishp () (eql    (first x)  'garnish))
           (secret   () (char= #\_ (elt (symbol-name (second x)) 0)))
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
    (when (and (defp) (docp) (not (secret)))
      (format s "~%`~(~a~) ~(~a~)`~%~%-" (second x) (or (third x) ""))
      (dump (fourth x) "   "))))

(defun readme()
  "Reading doco strings."
  (dolist (f (sort (directory "*.lisp") 
                   #'(lambda (x y) (string< (pathname-name x) 
                                            (pathname-name y)))))
    (let ((name (pathname-name f)))
      (unless (ends-with-p name "eg")
        (format t "~%~%<img src='https://goo.gl/m8uxAf' height=10 width=900>")
        (reads f #'fundoc)))))

(format t "~a"  +header+)
(readme)


