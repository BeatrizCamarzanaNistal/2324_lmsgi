(:consulto03: Mostrar los libros ordenados primero por “category” y luego por “title” en una sola consulta. :)
for $x in doc('libros')/bookstore/book
order by $x/@category, $x/title
return $x