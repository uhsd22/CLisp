# Основы языка Lisp
  ***[8, 12, 14, 20, 25, 31], [40, 41, 36], [45]***
  
  **Задача 8**
  ![](https://github.com/uhsd22/CLisp/blob/main/text/8.png)
  ```
  (defun pos/neg (list)
    (let ((res) (pos) (neg))
        (dolist (x list res)
            (if (>= x 0)
            (setf pos (append pos (list x)))
            (setf neg (append neg (list x)))))
    (setf res (list pos neg))))

(print (pos/neg '(-1 -2 -3 -4 -5))) ;result: (NIL (-1 -2 -3 -4 -5)) 
(print (pos/neg '(1 2 3 4 5))) ;result: ((1 2 3 4 5) NIL)
(print (pos/neg '(0 10 -10 15 -15))) ;result:((0 10 15) (-10 -15)) 
```
[Ссылка на решение](https://rextester.com/YIJNAI28754)

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
