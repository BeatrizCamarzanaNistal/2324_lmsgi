(: Consulta17: Mostrar el título del libro, su precio y su precio con el IVA incluido, cada uno con su propia etiqueta. 
Ordenado de precio con IVA:)
<libros>
  {
    for $x in doc('books')/bookstore/book
    let $iva := $x/price*1.21
    order by $iva
    return ($x/title, $x/price, <iva>{$iva}</iva>)
  }
</libros>
  