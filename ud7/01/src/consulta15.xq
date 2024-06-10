(: Consulta15: Mostrar los títulos de los libros y al final una etiqueta con el número total de libros:)
<libros>{
  for $x in doc('books')/bookstore
  return (
      $x/book/title,
      <total>
        {count($x/book)}
      </total>)
   }
</libros>
  

