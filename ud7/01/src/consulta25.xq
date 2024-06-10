(: Consulta24: . Mostrar los libros que contenga una X mayúscula o minúscula en el título ordenados de manera descendente:)
for $x in doc('../data/books.xml')/bookstore/book
where contains($x/title, 'x') or contains($x/title, 'X')
return ($x/title)
