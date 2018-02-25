(defun life (&key (p 0.2) (pause 0.2) (xmax 50) (ymax 50) (lives 100) (inits))
  (labels (
     (alive (b x y) (aref b x y))
     (board ()      (make-array (list xmax ymax) :initial-element nil))
     (board0 (b) 
             (if inits
               (dolist (init inits b)
                 (setf (aref b (first init) (second init)) t))
               (dotimes (x xmax b)
                 (dotimes (y ymax)
                   (setf (aref b x y) (< (random 1.0) p))))))
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
                   (format t "~&|")
                   (dotimes (x xmax)
                     (format t "~a" (if (alive b x y) "X" " ")))
                   (format t "|~%")))
     (main (old &aux (new (board))) 
           (draw-board old)
           (princ lives)
           (when (> (decf lives) 0)
             (dotimes (x xmax)
               (dotimes (y ymax)
                 (setf (aref new x y) (live? old x y))))
             (main new))))
    (main (board0 (board)))))

(defun clear ()
  #+clisp
  (shell "clear")
  #+sbcl
  (sb-ext:run-program "/bin/sh" (list "-c" "clear") 
                      :input nil :output *standard-output*))

;(life :xmax 50 :ymax 30 :p 0.3)

;(life :xmax 50 :ymax 50 :lives 100 :pause 0.1 :inits '((1 0) (2 1) (0 2) (1 2) (2 2))l)


(life 
  :inits '((5 1) (5
                  2) (6 1) (6 2) (5 11) (6 11) (7 11) (4 12) (3 13) (3 14) (8 12) (9
                  13) (9 14) (6 15) (4 16) (5 17) (6 17) (7 17) (6 18) (8 16) (3 21)
                 (4 21) (5 21) (3 22) (4 22) (5 22) (2 23) (6 23) (1 25) (2 25) (6
                    25) (7 25) (3 35) (4 35) (3 36) (4 36))
  :xmax 100 :ymax 100 :lives 500 :pause 0.01
  )


