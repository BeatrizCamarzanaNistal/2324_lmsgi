(: Consulta23: . Mostrar los libros que contenga una X mayúscula o minúscula en el título ordenados de manera descendente:)
for $x in doc('../data/books.xml')/bookstore/book
where starts-with($x/@category, 'c')
return ($x/title)
