(defun life (&key (p 0.2) (delay 0.2) (xmax 50)
                  (ymax 50) (generations 100))
  (labels (
    (board0 () (let ((tmp (make-array (list xmax ymax))))
                 (dotimes (x xmax tmp)
                   (dotimes (y ymax)
                     (setf (aref tmp x y) (< (random 1.0) p))))))
    (draw (b) (sleep delay)
              (clear)
              (princ (with-output-to-string (s)
                   (dotimes (y ymax)
                     (dotimes (x xmax)
                       (format s "~a"  (if (aref b x y) "X" " ")))
                     (format s "~%")))))
    (worker (b) (draw b)
                (if (< (decf generations) 0)
                  b
                  (let ((b1 (make-array (list xmax ymax))))
                    (dotimes (x xmax)
                      (dotimes (y ymax)
                        (setf (aref b1 x y) (num-alive x y b xmax ymax))))
                    (worker b1)))))
    (draw (worker (board0)))))

(defun num-alive (x y b xmax ymax)
  (labels (
     (alive   () (aref b x y))
     (alives? (&aux (out 0) (ds '(-1 0 1)))
             (dolist (dx ds out)
               (dolist (dy ds)
                 (let  ((x1 (+ x dx))
                        (y1 (+ y dy)))
                   (and (< 0 x1 xmax) 
                        (< 0 y1 ymax)
                        (not (and (= x x1) (= y y1)))
                        (aref b x1 y1)
                        (incf out)))))))
    (let ((n (alives?)))
      (or (and (alive) (member n '(2 3)))
          (and (not (alive)) (= n 3))))))

(defun clear ()
  #+clisp
  (shell "clear")
  #+scbl
  (sb-ext:run-program "/usr/bin/clear" '()))

(life :xmax 50 :ymax 30 :p 0.3)

