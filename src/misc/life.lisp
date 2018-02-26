(load "patterns")

(defun clear ()
  #+clisp
  (shell "clear")
  #+sbcl
  (sb-ext:run-program "/bin/sh" (list "-c" "clear") 
                      :input nil :output *standard-output*))

(defun command-line ()
  #+clisp ext:*args*
  #+sbcl (cdr sb-ext:*posix-argv*))

(defun run-command-line (fn argv)
  (setf argv (mapcar 'read-from-string argv))
  (apply fn argv))

(defun life (&key (model "") (p 0.2) (pause 0.2) 
                  (xmax 50) (ymax 50) (lives 100) (inits))
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
                 (princ 
                   (with-output-to-string (s)
                     (dotimes (y ymax)
                       (format s "~&|")
                       (dotimes (x xmax)
                         (format s "~a" (if (alive b x y) "X" " ")))
                       (format s "|~%")))))
     (main (old &aux (new (board)) changed)
           (draw-board old)
           (format t "~a:~a~%"  model lives)
           (when (> (decf lives) 0)
             (dotimes (x xmax)
               (dotimes (y ymax)
                 (setf (aref new x y) (live? old x y)
                       changed
                       (or changed
                           (not (eq (aref old x y) (aref new x y)))))))
             (if changed (main new)))))
    (main (board0 (board)))))

(defun main (&key model (p 0.2) (pause 0.2) 
                  (xmax 100) (ymax 50) (lives 100))
  (labels (
     (coords (str)
             (let (out
                    (x 0)
                    (y 5))
               (loop for c across str do 
                     (case c
                       (#\Newline (incf y)
                        (setf x 5))
                       (#\Space   nil)
                       (#\*       (push `(,x ,y) out)
                        (incf x))
                       (#\.       (incf x))))
               (reverse out))))
    (if model
      (let ((inits (coords (cdr (assoc model +patterns+)))))
        (life :xmax xmax :lives lives :ymax ymax  :pause pause
              :p p :model model :inits inits))
      (dolist (model +patterns+)
        (main :model (car model) :p p :pause pause 
              :xmax xmax :ymax ymax :lives lives)))))

(run-command-line #'main (command-line))
