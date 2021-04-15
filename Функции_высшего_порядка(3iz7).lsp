(print "problem 1")
(print "Определите FUNCALL через функционал APPLY.")

(defun funcall_handmade (func &rest args) 
   (cond
    ((null args) nil)
    (t (apply func args))
   ) 
  )

(print (funcall_handmade '- 2 3 4))
(print (funcall_handmade '+ ))
(print (funcall_handmade 'max 2 3 4 5 ))

(print "problem 9")
(print "Напишите генератор порождения чисел Фибоначчи")

(defun generator ()
    (let ((pos_1 0) (pos_2 1))
        (lambda ()
            (setq
                tmp pos_1
                pos_1 (+ pos_2 pos_1)
                pos_2 tmp
             )
         )
    )
)

(setq start_func (generator))
(print (funcall start_func))
(print (funcall start_func))
(print (funcall start_func))
(print (funcall start_func))
(print (funcall start_func))
(print (funcall start_func))
(print (funcall start_func))


(print "problem 11")
(print "Определите фукнционал МНОГОФУН, который использует функции, являющиеся аргументами, по следующей схеме: (МНОГОФУН ’(f g ... h) x) ⇔ (LIST (f x) (g x) ... (h x)).")

(defun МНОГОФУН (functions argument)
    (cond
          ((null functions) nil)
          ((null argument) nil)
          (t (cons (funcall (car functions) argument) 
                   (МНОГОФУН (cdr functions) argument) ) )
    ) 
)
(defun f1 (tmp) (* 5 tmp))
(defun f2 (tmp) (/ tmp 3))

(print ( МНОГОФУН '(atom abs sqrt f1 f2) 35 ))
(print ( МНОГОФУН '(atom abs sqrt f1 f2) ()))
(print ( МНОГОФУН '() 35 ))
