(:consulta15: Mostrar el título y el número de caracteres que tiene cada título, cada uno con su propia etiqueta:)
<libros>
  {
    for $x in doc('books')/bookstore/book
    return(
      <libro>
        <titulo>{data($x/title)}</titulo>
        <caracteres>{string-length($x/title)}</caracteres>
      </libro>
    )
  }
</libros>


