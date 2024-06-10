(:consulta17: Mostrar todos los autores eliminando los que se repiten y ordenados por el número de caracteres 
que tiene cada autor:)
for $x in distinct-values(doc('books')/bookstore/book/author)
order by string-length($x)
return data($x)



