(:consulta07:Mostrar el título del libro, su precio y su precio con el IVA incluido, cada uno con su propia etiqueta. 
Ordenado de precio con IVA:)
<libros>
  {
    for $x in doc('libros')/bookstore/book
    let $y := ($x/price*1.21)
    order by $y
    return ($x/title, $x/price, <iva>{$y}</iva>)
  }
</libros>
