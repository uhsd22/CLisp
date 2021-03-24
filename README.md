# Основы языка Lisp
  ***[8, 12, 14, 20, 25, 31], [40, 41, 36], [45]***
  
  **Задача 8**
  ![](https://github.com/uhsd22/CLisp/blob/main/text/8.png)
  ```
(defun a (l1 l2)
    (cond ((null l1) l2)
          ((null l2) l1)
          (t (cons (car l1) (a (cdr l1) l2)))
        )
    )

(defun pos/neg (list)
    (let ((res) (pos) (neg))
        (dolist (x list res)
            (if (>= x 0)
            (setf pos (a pos (list x)))
            (setf neg (a neg (list x)))))
    (setf res (list pos neg))))

(print (pos/neg '(-1 -2 -3 -4 -5))) ;(NIL (-1 -2 -3 -4 -5)) 
(print (pos/neg '(1 2 3 4 5))) ;((1 2 3 4 5) NIL) 
(print (pos/neg '(0 10 -10 15 -15)));((0 10 15) (-10 -15)) 

```
[Ссылка на решение](https://rextester.com/ZVJZ15639)

  **Задача 12**
  ![](https://github.com/uhsd22/CLisp/blob/main/text/12.png)
  ```
  (defun pair_func (list)
 (cond 
     ((null (cdr list)) list)
       ((eq (car list) (cadr list)) (cons (car list) (pair_func (cddr list))))
       (t (cons (car list) (pair_func (cdr list))))
     ))

(print (pair_func '(1 2 3 4 5))) ;result: (1 2 3 4 5) 
(print (pair_func '(1 1 2 2 3 3 4 4)));result: (1 2 3 4)
(print (pair_func '(1 A A 2 V V B B)));result: (1 A 2 V B)
(print (pair_func '(A))) ;result: (A)
```
[Ссылка на решение](https://rextester.com/ACHDF22788)

  **Задача 14**
  ![](https://github.com/uhsd22/CLisp/blob/main/text/14.png)


 **Задача 20**
  ![](https://github.com/uhsd22/CLisp/blob/main/text/20.png)
  ```
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

```
[Ссылка на решение](https://rextester.com/ALB59789)



 **Задача 25**
  ![](https://github.com/uhsd22/CLisp/blob/main/text/25.png)
  ```
(defun EDel (list)
                (cond 
                    ((null list) NIL)
                    (t (cons (car list) (EDel (cddr list)))
                    )
                )
)

(print (EDel '(1 2 3 4 5 6 7 8 9 10))) ; ans : (1 3 5 7 9) 
(print (EDel '(1 (2 3 4) 5 (6 7 8) 9 10))); ans : (1 5 9) 

```
[Ссылка на решение](https://rextester.com/YVCUDB29574)

 **Задача 31**
  ![](https://github.com/uhsd22/CLisp/blob/main/text/31.png)
  ```
(defun checker (at list)
  (cond 
      ((null list) nil)
        ((equalp at (car list)) t)
        ((checker at (cdr list)))
      ))
    
(defun start_func (l1 l2)
  (cond 
      ((null l1) nil)
        ((checker (car l1) l2) (car l1))
        (t (start_func (cdr l1) l2))
      ))


(print (start_func '(5 6 7 8) '(6 5 3))  ) ; res: 5
(print (start_func '() '()) )  ; res: NIL
(print (start_func '(1 2 3) '(4)) ) res: NIL
(print (start_func '(13) '(6 5 3 13))  ) res: 13

```
[Ссылка на решение](https://rextester.com/ILP54762)


 **Задача 45**
  ![](https://github.com/uhsd22/CLisp/blob/main/text/45.png)
  ```

```
