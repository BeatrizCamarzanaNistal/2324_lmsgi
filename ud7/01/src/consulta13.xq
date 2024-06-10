(: Consulta13: Mostrar los libros ordenador primero por “category” y luego por “title” en una sola consulta.  :)
<libros>{
    for $x in doc('books')/bookstore
    order by $x/book[@category]
    order by $x/title
    return $x/title/text()
  }
</libros>