(: Consulta22: Mostrar los libros escritos en años que terminan en “3”:)
let $x := doc('../data/books.xml')/bookstore/book
return ($x/year/last())