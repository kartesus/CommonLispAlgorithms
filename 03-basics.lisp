;; Sequential execution
(block test
  (print "hello")
  (+ 2 2))

(block test
  (return-from test 0)
  (print "hello"))

(block nil
  (return 0)
  (print "hello"))

;; If there's not plan to return prematurely
(progn
 (print "hello")
 (+ 2 2))

;; Branching
(if nil
    (print "hello")
    (print "world"))

(when (+ 2 2)
      (print "hello"))

(unless (+ 2 2)
  (print "hello"))

(cond ((typep 4 'string)
        (print "hello"))
      ((> 4 2)
        (print "world"))
      (t
        (print "cont't get here")))


;; Looping
(dotimes (i 3)
  (print i))

(do ((i 0 (1+ i))
     (prompt (read-line) (read-line)))
    ((> i 1) i)
  (print (list i prompt))
  (terpri))

;; don't use this
(loop
for i from 100 to 150
for item in '(1 2 3)
do
  (print (list i item)))

;; variables and procedures
((lambda (x y) (+ x y)) 2 2)

(defun add (x y) (+ x y))
(add 2 2)

(let ((x 2))
  (+ x x))

(let* ((len (length '(1 2 3 4 5)))
       (mid (floor len 2))
       (left-part (subseq '(1 2 3 4 5) 0 mid))
       (right-part (subseq '(1 2 3 4 5) mid)))
  (print mid)
  (print left-part)
  (print right-part))

(defparameter *temp* 1)
(print *temp*)

(funcall 'add 2 2)

(let ((add (lambda (x y) (+ x y))))
  (funcall 'add 2 2))

(flet ((succ (x) (1+ x)))
  (print (succ 1)))
