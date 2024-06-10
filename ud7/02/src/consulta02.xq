(:consulta02: Mostrar los años de publicación, primero con for y luego con let. Etiquetar la salida con publicación :)
let $x := doc('libros')/bookstore/book
return $x/year/text()