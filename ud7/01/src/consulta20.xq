(: Consulta20: Mostrar el título y el número de autores que tiene cada título en etiquetas diferentes.:)
let $x := doc('../data/books.xml')/bookstore/book
return ($x/title,$x/author)