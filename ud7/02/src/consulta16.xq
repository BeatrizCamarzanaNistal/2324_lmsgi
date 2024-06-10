(:consulta16: Mostrar todos los años en los que se ha publicado un libro eliminando los repetidos. Etiquétalos con "año":)
<libros>
  {
    for $x in distinct-values(doc('books')/bookstore/book/year)
    return(
      <anyo>{$x}</anyo>
    )
  }
</libros>


