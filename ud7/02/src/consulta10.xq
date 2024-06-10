(:consulta10: Mostrar el título y el número de autores que tiene cada título en etiquetas diferentes.:)
<libros>{
  for $x in doc('books')/bookstore/book
   return ($x/title,
      <num_autores>{count($x/author)}</num_autores>
    )}
</libros>

