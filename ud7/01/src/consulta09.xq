(: Consulta9.Mostrar el título del libro cuando tenga más de dos autores.:)
for $x in doc('books')/bookstore/book
where count($x/author)>=2
return $x/title/text()