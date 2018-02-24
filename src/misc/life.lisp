;;;;Conway's Game of Life in Lisp
;;;;
;;;;Sample patterns:
;;;;  Blinker: (game-start '((0 1) (1 1) (2 1)) 3 10)
;;;;  Beacon: (game-start '((1 1) (2 1) (1 2) (4 3) (3 4) (4 4)) 6 10)
;;;;  Glider: (game-start '((1 0) (2 1) (0 2) (1 2) (2 2)) 20 50)
;;;;  Combination: (game-start '((0 12) (1 12) (2 12) (1 6) (2 7) (0 8) (1 8) (2 8)) 20 100)
;;;;  R-Pentomino: (game-start '((7 11) (6 12) (7 12) (8 12) (6 13)) 30 100)
;;;;  Gosper Glider Gun: (game-start '((5 1) (5 2) (6 1) (6 2) (5 11) (6 11) (7 11) 
;;;;                                   (4 12) (3 13) (3 14) (8 12) (9 13) (9 14) (6 15) 
;;;;                                   (4 16) (5 17) (6 17) (7 17) (6 18) (8 16) (3 21) 
;;;;                                   (4 21) (5 21) (3 22) (4 22) (5 22) (2 23) (6 23) 
;;;;                                   (1 25) (2 25) (6 25) (7 25) (3 35) (4 35) (3 36) (4 36)) 40 100)

(defmacro ? (obj first-slot &rest more-slots)
  (if (null more-slots)
      `(slot-value ,obj ',first-slot)
      `(? (slot-value ,obj ',first-slot) ,@more-slots)))

(defmacro is (&rest lst)
  (setf lst (reverse lst))
  `(setf (? ,@(reverse (cdr lst))) ,(car lst)))
   
(defstruct xy x y)
(defstruct cell xy alive)

(defun board (xmax ymax  inits)
  (let ((b (make-array `(,xmax ,ymax))))
    (dotimes (x xmax)
      (dotimes (y ymax)
        (setf (aref b x y)
              (make-cell :xy (make-xy :x x :y y)))))
    (dolist (init inits b)
      (is (aref b (first init) (second init))
          alive t))))

(defun life (&key b xmax ymax inits (generations 100))
  (let ((b (or b 
               (board xmax ymax inits))))
    (unless (< generations 0)
      (dotimes (x xmax)
        (dotimes (y ymax)
           (is (aref b x y) (will-live b x y)))))))        

(defmethod ok ((b board) pair)
  (and (<= 0 (first pair) (board-xmax b))
       (<= 0 (second pair) (board-ymax b))))

(defun around (pos dxs dys b &aux out)
  (with-slots (x y) pos
    (dolist (dx dxs out)
      (dolist (dy dys)
        (let* ((x1   (+ x dx))
               (y1   (+ y dy))
               (new `(,x1 ,y1)))
          (if (and (ok  b new)
                   (or (not (= x x1)) (not (= y y1))))
            (push `(,x1 ,y1) out)))))))

(defmethod alives ((b board) pos)
  (count-if #'(lambda (pos) (alive b pos))
            (around pos '(-1 0 1) '(-1 0 1) b)))

(defun will-live (pos b)
  (let ((n (alives b pos)))
    (cond ((< n 2) nil)
          ((and (= n 2) (alive b pos)) t)
          ((= n 3) t)
          ((> n3) nil)))

(defun draw (live-cells grid size-sq)
  (clear)
  (format t "~a" 
    (with-output-to-string (s)
      (dolist (grid-cell grid)
        (format s "~a"  
                (if (member grid-cell live-cells :test #'equal) "X" " "))
        (if (zerop (mod (+ 1 (car (cdr grid-cell))) size-sq))
          (format s "~%"))))))

(defun clear()
  #+clisp
  (shell "clear")
  #+scbl
  (sb-ext:run-program "/usr/bin/clear" '()))
