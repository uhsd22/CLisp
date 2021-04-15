(print "problem 8")
(print "разбить исходных список на два списка: список положительных и список отрицательных чисел")
(defun sep (lst &optional (pos nil) (neg nil))
    (cond
        ((null lst) (list pos neg))
        
        (
         (< (car lst) 0)
         (sep (cdr lst) pos (cons (car lst) neg))
         )
        
        (
         (>= (car lst) 0)
         (sep (cdr lst) (cons (car lst) pos) neg)
         )
        (
         t (list pos neg)
         )
        )
    )

(print (sep '(-0 -1 -2 -3 -5)))
(print (sep '(0 1 2 3 5)))
(print (sep ()))
(print (sep '(3 1 -2 53 -5)))

(print ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;")
(print "problem 12")
(print "определите функцию, заменяющую два подряд идущих элемента одним")

(defun cut (lst)
    ((lambda (c_func)
    (cond
        ((null lst) lst)
        ((equal c_func (cadr lst)) (cut(cons c_func (cddr lst))))
        (t (cons c_func (cut (cdr lst))))
        )
      )
       (car lst)
       )
    )

(print (cut '(1 1 2 2 3 4 5)))
(print (cut '(1 2 3 4 5)))
(print (cut '()))
(print (cut '(1)))

(print ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;")
(print "problem 14")
(print "определите функцию, осуществляющую переставновку двух элементов с заданными номерами")

;(defun swap (lst first sec)
;    (cond
;        ((> first sec) (swap lst sec first))
;        )
;    )

;(print (checker '((1 2 3 4 5) 3 1)))

(print ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;")
(print "problem 20")
(print "определите функцию ПЕРВЫЙ-АТОМ, результатом которой будет пурвый атом списка")

(defun ПЕРВЫЙ-АТОМ (lst)
    ((lambda (head)
     (cond
       ((atom head) head)
       (t (ПЕРВЫЙ-АТОМ head))
         )
      )
     (car lst)
     )
 )
(print (ПЕРВЫЙ-АТОМ  '(((a b)) (c) d)))
(print (ПЕРВЫЙ-АТОМ  '(123 a b 4 )))
(print (ПЕРВЫЙ-АТОМ  '() ))

(print ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;")
(print "problem 25")
(print "определите функцию , удаляющую каждый четный элемент")

(defun del (lst)
    (cond
      ((null lst) nil)
      (t (cons (car lst) (del (cddr lst))))
    )
)
(print (del '(1 2 3 4 5)))
(print (del '()))
(print (del '(1)))
(print (del '(1 2)))

(print ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;")
(print "problem 31")
(print "определите функцию , которая возвращает первый элемент, входящий в оба списка")

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
(print (start_func '(2) '(1 2 3)))
(print (start_func '(4 5 3) '(1 2 3)))
(print (start_func '() '()))
(print ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;")
(print "problem 36")
(print "определите предикат НЕПЕРЕСЕКАЮЩИЙСЯ, что два множества не пересекаются")
(defun dlt (lst el)
    (
        (lambda (head tail)
            (cond
                ((null lst) NIL)
                ((equalp head el) tail)
                (t (cons head (dlt tail el)))
            )   
        )
        (car lst) (cdr lst)
    )
)
 
(defun РАЗНОСТЬ (lst del_arr)
    (
        (lambda (first_del_arr tail_del_arr)
            (cond
                ((null del_arr) lst)
                (t (РАЗНОСТЬ (dlt lst first_del_arr) tail_del_arr))
            )
        )
        (car del_arr) (cdr del_arr)
    )
)

(defun НЕПЕРЕСЕКАЮЩИЙСЯ (lst1 lst2)
    (cond
        ((equalp (РАЗНОСТЬ lst1 lst2) lst1) "не пересекаются")
        (t "пересекаются")
    )
)

(print (НЕПЕРЕСЕКАЮЩИЙСЯ '(3 2 4 5) '(3 1 6)))
(print (НЕПЕРЕСЕКАЮЩИЙСЯ '(8 13 15) '(3 1 6)))
(print (НЕПЕРЕСЕКАЮЩИЙСЯ '(a s d f) '(m n k)))
(print ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;")
(print "problem 40")
(print "определите функцию РАЗНОСТЬ, удаляющую из первого множества все общие со вторым элементы")

(defun dlt (lst el)
    (
        (lambda (head tail)
            (cond
                ((null lst) NIL)
                ((equalp head el) tail)
                (t (cons head (dlt tail el)))
            )   
        )
        (car lst) (cdr lst)
    )
)
 
(defun РАЗНОСТЬ (lst del_arr)
    (
        (lambda (first_del_arr tail_del_arr)
            (cond
                ((null del_arr) lst)
                (t (РАЗНОСТЬ (dlt lst first_del_arr) tail_del_arr))
            )
        )
        (car del_arr) (cdr del_arr)
    )
)

(print (РАЗНОСТЬ '(3 2 4 5) '(3 1 6)))
(print (РАЗНОСТЬ '(1 2 3 4) '(1 2 3 4)))
(print (РАЗНОСТЬ '(1 2 3 4) '(6 7 8)))

(print ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;")
(print "problem 41")
(print "Реализовать генератор деревьев, чтобы выдаваемые им деревья имели количество вершин, точно соответствующее числу, указанному в его первом аргументе.")

(defun plant_a_tree (n &optional (number 0))
	(( lambda (index)
		(cond 
            ((<= n number) nil)
			(t (list number (plant_a_tree n index) (plant_a_tree n (+ index 1)) ))
 
		)) (+ (* number 2) 1)
	)

)
(print (plant_a_tree '0))
(print (plant_a_tree '1))
(print (plant_a_tree '4))
(print (plant_a_tree '10))