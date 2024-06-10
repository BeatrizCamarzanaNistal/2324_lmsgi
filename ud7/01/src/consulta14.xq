(: Consulta14:  Mostrar cuántos libros hay, y etiquetarlo con “total”:)
for $x in doc('books')/bookstore
return 
  <total>
    {count($x/book)}
  </total>