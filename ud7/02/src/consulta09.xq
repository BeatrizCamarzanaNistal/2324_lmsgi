(:consulta09: Mostrar cada uno de los precios de los libros , y al final una etiqueta con la suma de los precios.:)
<libros>
  {
   let $x := doc('libros')/bookstore/book
  return ($x/price,<total>{sum($x/price)}</total>)
  }
</libros>
