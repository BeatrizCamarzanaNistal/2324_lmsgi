(: Consulta19: Mostrar cada uno de los precios de los libros , y al final una etiqueta con la suma de los precios:)
<precios>
  {
    let $x := doc('books')/bookstore/book
    return ($x/price,<total>{sum($x/price)}</total>)
  }
</precios>