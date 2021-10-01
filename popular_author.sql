SELECT NPSurname FROM author
WHERE idAuthor = (SELECT Author FROM book
					WHERE idBook IN (SELECT Book FROM copyofbook
									WHERE idcopyOfBook IN ( SELECT copyOfBook FROM operation
															WHERE typeOperation = 'take' and YEAR(Data) = '2019'
															GROUP BY copyOfBook
															ORDER BY COUNT(copyOfBook) DESC
														 )
									GROUP BY Book
									ORDER BY COUNT(Book) DESC
									)
					GROUP BY Author
					ORDER BY COUNT(Author) DESC
                    Limit 1
					)
                    
                                    



