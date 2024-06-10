(:consulta12: Mostrar los libros escritos en años que terminan en “3”:)
<libros>
    {
      for $x in doc('books')/bookstore/book
      where ends-with($x/year, '3')
      return $x
    }
</libros>

