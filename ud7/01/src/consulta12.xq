(: Consulta12:Mostrar los años de publicación, primero con for y luego con let. Etiquetar la salida con publicación :)
  <publicacion>{
    for $x in doc('books')/bookstore/book
    return 
      $x/year
    }
</publicacion>