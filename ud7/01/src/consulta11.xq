(: Consulta11:Mostrar el título y el autor de los libros del año 2005, y etiquetar cada uno de ellos con lib2005. :)
<libros>{
  for $x in doc('books')/bookstore/book
  where $x/year=2005
  return 
      <lib2005>
        {$x/title/text()}
      </lib2005>
  }
   </libros>