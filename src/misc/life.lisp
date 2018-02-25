(defun life (&key (p 0.2) (pause 0.2) (xmax 50) (ymax 50) (lives 100))
  (labels (
     (alive (b x y) (aref b x y))
     (board ()      (make-array (list xmax ymax)))
     (random-board (b) 
                   (dotimes (x xmax b)
                     (dotimes (y ymax)
                       (setf (aref b x y) (< (random 1.0) p)))))
     (live? (b x y &aux (n 0)) 
            (dolist (x1   (list (- x 1) x (+ x 1)))
              (dolist (y1 (list (- y 1 )y (+ y 1)))
                (and (<= 0 x1 (1- xmax)) 
                     (<= 0 y1 (1- ymax))
                     (not (and (= x x1) (= y y1)))
                     (alive b x1 y1)
                     (incf n))))
            (if (alive b x y) 
              (<= 2 n 3) ; enough friendly neigbhors 
              (= n 3))) ; time to get born
     (draw-board (b) 
                 (sleep pause)
                 (clear)
                 (dotimes (y ymax)
                   (dotimes (x xmax)
                     (format t "~a" (if (alive b x y) "X" " ")))
                   (format t "~%")))
     (main (old &aux (new (board))) 
           (draw-board old)
           (when (> (decf lives) 0)
             (dotimes (x xmax)
               (dotimes (y ymax)
                 (setf (aref new x y) (live? old x y))))
             (main new))))
    (main (random-board (board)))))

(defun clear ()
  #+clisp
  (shell "clear")
  #+sbcl
  (sb-ext:run-program "/bin/sh" (list "-c" "clear") 
                      :input nil :output *standard-output*))

(life :xmax 50 :ymax 30 :p 0.3)

