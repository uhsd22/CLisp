;8 Определите функцию, которая разделит исхоодный список из целых чисел на два списка: список положительных чисел и список отрицательных чисел.
(print '(";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"))
(print '(problem 8))
(print '(";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"))


(defun sep (set &optional (pos nil) (neg nil))
    
    (
     cond ((null set) (list neg pos))
        
        ((>= (car set) 0) (sep (cdr set)
            (cons (car set) pos) neg))
        
        ((< (car set) 0) (sep (cdr set) pos
            (cons (car set) neg)))
        
        (t (sep (cdr set) pos neg)))
    ) 

(print (sep '(-1 -2 -3 -4 -5))) ;(NIL (-1 -2 -3 -4 -5)) 
(print (sep '(1 2 3 4 5))) ;((1 2 3 4 5) NIL) 
(print (sep '(0 10 -10 15 -15)));((0 10 15) (-10 -15)) 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;20 Определите функцию, результатом которой будет первый атом списка
(print '(";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"))
(print '(problem 20))
(print '(";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"))

(defun felem (list)
 ((lambda (head)
       (cond ((atom head)  head)
        (t  (felem head))
       )  
  ) 
  (car list)
 )

)
(print (felem  '(((a b)) (c) d))) ; => A
(print (felem  '(123 a b 4 ))) ; => 123
(print (felem  '() )) ; => NIL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;25 Определите функцию, результатом которая удаляет каждый четный элемент списка

(print '(";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"))
(print '(problem 25))
(print '(";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"))


(defun EDel (list)
              (cond 
                  ((null list) NIL)
                  (t (cons (car list) (EDel (cddr list)))
                  )
              )
)

(print (EDel '(1 2 3 4 5 6 7 8 9 10))) ; ans : (1 3 5 7 9) 
(print (EDel '(1 (2 3 4) 5 (6 7 8) 9 10))); ans : (1 5 9) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;31 Определите функцию, которая возвращает первый элемент входящий в оба списка

(defun checker (at list)
(cond 
    ((null list) nil)
      ((equalp at (car list)) t)
      ((checker at (cdr list)))
    ))
  
(defun start_func (l1 l2)
(cond 
    ((null l1) nil)
    ((null l2) nil)
      ((checker (car l1) l2) (car l1))
      (t (start_func (cdr l1) l2))
    ))


(print (start_func '(5 6 7 8) '(6 5 3))  ) ; res: 5
(print (start_func '() '()) )  ; res: NIL
(print (start_func '(1 2 3) '(4)) ); res: NIL
(print (start_func '(13) '(6 5 3 13))  ); res: 13
