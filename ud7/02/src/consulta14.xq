(:consulta14: Mostrar los libros que contenga una X mayúscula o minúscula en el título ordenados de manera 
descendent:)
for $x in doc('books')/bookstore/book
where contains(lower-case($x/title), 'x')
order by $x/title descending
return data($x/title)


