
# понятие «злостный читатель» определю просто, как тот человек, кто совершил больше всего активности в библиотеке за единицу времени
# просто выбираю из таблицы совершенных операций студентов, сортирую по убыванию активности и возвращаю одного
SELECT Name, Surname FROM student
				WHERE idStudent = ( SELECT Student FROM operation
										WHERE YEAR(Data) = '2019'
										GROUP BY Student
										ORDER BY COUNT(Student) DESC
                                        LIMIT 1
										)
