(: Consulta12:Mostrar los años de publicación, primero con for y luego con let. Etiquetar la salida con publicación :)
let $x := doc("books")/bookstore/book/year

return <publicacion>{$x}</publicacion>