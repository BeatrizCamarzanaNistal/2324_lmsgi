(:consulta13: Mostrar los libros cuya categoría empiece por C:)
for $x in doc('books')/bookstore/book
where starts-with(lower-case($x/@category), 'c')
return data($x/title)


